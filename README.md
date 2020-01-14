# ceh-pmml-models

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ruivieira/ceh-pmml-models/master?filepath=models.ipynb)

Example Jupyter notebook can be viewed [here](models.ipynb).
It can be executed online [here](https://mybinder.org/v2/gh/ruivieira/ceh-pmml-models/master?filepath=models.ipynb).

## Models

Models are in the [models](/models) folder. The two PMML files are:

* `rf_segmentation.pmml` - a "large" model, with 1000 trees (18Mb)
* `rf_segmentation_small.pmml` - a "smaller" model, with 162 trees (2.7Mb)

## Dataset

A sample dataset is available [here](data/dataset.csv).

## Predictions

Sample output from [jpmml](https://github.com/jpmml/jpmml-evaluator):

```text
------------------------------------------------------------------------------
{age=ContinuousDouble{opType=continuous, dataType=double, value=32.21556819580098}, income=ContinuousDouble{opType=continuous, dataType=double, value=5.370116396577485}, response=ContinuousDouble{opType=continuous, dataType=double, value=0.0}}
{segment=0, probability_0=0.9032258064516129, probability_1=0.0967741935483871, probability_2=0.0, predicted_segment=0}
------------------------------------------------------------------------------
{age=ContinuousDouble{opType=continuous, dataType=double, value=30.23771420174174}, income=ContinuousDouble{opType=continuous, dataType=double, value=116.99344386773195}, response=ContinuousDouble{opType=continuous, dataType=double, value=1.0}}
{segment=1, probability_0=0.0, probability_1=1.0, probability_2=0.0, predicted_segment=1}
------------------------------------------------------------------------------
{age=ContinuousDouble{opType=continuous, dataType=double, value=16.658638021134774}, income=ContinuousDouble{opType=continuous, dataType=double, value=221.54952628874256}, response=ContinuousDouble{opType=continuous, dataType=double, value=1.0}}
{segment=2, probability_0=0.0, probability_1=0.04838709677419355, probability_2=0.9516129032258065, predicted_segment=2}
------------------------------------------------------------------------------
```

Confidence can be extracted by matching with the predicted output label, *e.g.* for the first item above, `predicted_segment=0`, therefore the "confidence" is `probability_0=0.9032258064516129`.
