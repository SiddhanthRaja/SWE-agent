#!/bin/bash
#this script runs and evaluates the agent N times.
#to run:
#bash run_and_eval.sh '' default_with_inclusive_edit_demo_v2 data/dev-easy/swe-bench-dev-easy-med.json 3
# vars:                suffix   template                        data                                    number of runs

for((i=1; i<=1; i++)); do
	# command 1
	python run.py --model_name azure:gpt-4-turbo-2024-04-09 --config_file ./config/default.yaml --per_instance_cost_limit 2.00 \
	--instance_filter "pytest-dev__pytest-11148 sympy__sympy-14317 pytest-dev__pytest-6116 matplotlib__matplotlib-23562 django__django-11999 django__django-16379 django__django-17051 pylint-dev__pylint-6506 django__django-13315 pylint-dev__pylint-7114 django__django-15781 pallets__flask-4045 matplotlib__matplotlib-25498 pydata__xarray-4094 sympy__sympy-11897 django__django-11905 sympy__sympy-12454 scikit-learn__scikit-learn-13439 matplotlib__matplotlib-23563 django__django-13933 django__django-14382 matplotlib__matplotlib-26020 django__django-16139 sympy__sympy-21627 django__django-11283 pytest-dev__pytest-5227 django__django-16820 pytest-dev__pytest-5221 sympy__sympy-22714 sympy__sympy-14308"
	 
	# command 2
	python evaluation/evaluation.py \
		--predictions_path trajectories/$USER/azure-gpt-4-turbo-2024-04-09__SWE-bench_Lite__default__t-0.00__p-0.95__c-2.00__install-1/all_preds.jsonl \
		--swe_bench_tasks "princeton-nlp/SWE-bench_Lite" \
		--log_dir ./results \
		--testbed ./testbed \
		--skip_existing \
		--timeout 900 \
		--verbose
done
