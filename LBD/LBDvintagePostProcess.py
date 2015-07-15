from LBDhelpers import *
from LBDpyomoVintageMin import vintageModel


if __name__ == "__main__":
	'''
	This module should be called from the command line to set up all parameters,
	create the model, solve and plot the results. 
	'''
	
	# generate the parameter data from the LBDhelpers module.
	params = genData()
	print
	print "\t Imported parameters successfully"

	# Create the model
	model = vintageModel(params)
	print "\t Constructed model"

	# Solve the model
	instance = NLmodelSolve(model)

	# Get solution and constraint values
	constraintDict = getConstraints(instance)
	varDict = getVars(instance)

	print "\t Generating graphs"
	genVintPlot(params, constraintDict, varDict)








