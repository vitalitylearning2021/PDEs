#include <stdio.h>

#include <stdlib.h>

#include "InputOutput.cuh"

#define Npixels	640							// --- Image width
#define Mpixels	640							// --- Image height

#define MAX_NUM_ITERS	50000			// --- Maximum number of FDTD iterations. Must be even.

// --- struct ProblemParameters containing all the problem parameters
typedef struct {
	int		x, y;						// --- Coordinates of the pipe center
	float	radius;						// --- Radius of the pipe
	float	T_pipe, T_air, T_ground;	// --- Temperatures in pipe, air, ground
} ProblemParameters;

ProblemParameters bc = { Npixels / 2, Mpixels / 2, Npixels / 10.f, 200.f, 20.f, 10.f };

/***************************************************/
/* SETTING THE BOUNDARY CONDITIONS DEVICE FUNCTION */
/***************************************************/
void setBoundaryConditions(float* d_T, const int width, const int height, const int idx,
	const int tidx, const int tidy, const ProblemParameters bc) {

	// --- Set the pipe temperature to T_pipe and return
	float distanceFromPipeCenterSquared = ((tidx - bc.x) * (tidx - bc.x) + (tidy - bc.y) * (tidy - bc.y));
	if (distanceFromPipeCenterSquared < bc.radius * bc.radius) d_T[idx] = bc.T_pipe;

	// --- Set the left, right and upper border temperature to T_air and return
	if ((tidx == 0) || (tidx == width - 1) || (tidy == 0)) d_T[idx] = bc.T_air;

	// --- Set the lower border temperature to T_ground and return
	if (tidy == height - 1) d_T[idx] = bc.T_ground;

}

/*************************/
/* RESET TEMPERATURE CPU */
/*************************/
void resetTemperatureCPU(float* h_temperature, int width, int height, ProblemParameters bc) {

	for (int j = 0; j < height; j++)
		for (int i = 0; i < width; i++) {
			const int idx = j * width + i;
			h_temperature[idx] = bc.T_air;
		}
}

/***********************************/
/* JACOBI ITERATION FUNCTION - CPU */
/***********************************/
void temperatureUpdateCPU(float* __restrict h_T, float* __restrict h_T_new, const int width, const int height, const ProblemParameters bc) {

	// --- Only update "interior" (not boundary) node points
	for (int j = 0; j < height; j++)
		for (int i = 0; i < width; i++) {
			const int idx = j * width + i;
			if ((i > 0) && (i < width - 1) && (j > 0) && (j < height - 1))
				h_T_new[idx] = 0.25f * (h_T[idx - 1] +
					h_T[idx + 1] +
					h_T[idx + width] +
					h_T[idx - width]);
			setBoundaryConditions(h_T_new, width, height, idx, i, j, bc);
		}
}

/********/
/* MAIN */
/********/
int main() {

	float* h_temperature = (float*)malloc(Npixels * Mpixels * sizeof(float));
	float* h_temperature_new = (float*)malloc(Npixels * Mpixels * sizeof(float));

	resetTemperatureCPU(h_temperature, Npixels, Mpixels, bc);

	for (int iter = 0; iter < MAX_NUM_ITERS / 2; iter++) {
		temperatureUpdateCPU(h_temperature, h_temperature_new, Npixels, Mpixels, bc);
		temperatureUpdateCPU(h_temperature_new, h_temperature, Npixels, Mpixels, bc);
	}

	saveCPUrealtxt(h_temperature, ".\\CPU_result.txt", Npixels * Mpixels);

	return 0;
}