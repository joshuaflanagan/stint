require 'stint/version'
require 'stint/github'
#TODO: get a list of workflow states (from the list of issues)
# get a list of issues in a specific workflow state
# promote an issue into the next higher state (unlabelled, gets 1st state - last state, gets closed)
# demote an issues into the next lower state (first state, gets unlabelled, unlabelled - noop)
