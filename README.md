# ceh-pmml-models

## Predictions

Sample output from [jpmml](https://github.com/jpmml/jpmml-evaluator):

```
------------------------------------------------------------------------------
{age=ContinuousDouble{opType=continuous, dataType=double, value=23.859944060544702}, income=ContinuousDouble{opType=continuous, dataType=double, value=25.051352275926725}, class=ContinuousDouble{opType=continuous, dataType=double, value=0.0}, response=ContinuousDouble{opType=continuous, dataType=double, value=1.0}}
{segment=1, probability_0=0.0, probability_1=1.0, probability_2=0.0, predicted_segment=1}
------------------------------------------------------------------------------
{age=ContinuousDouble{opType=continuous, dataType=double, value=56.65657833416327}, income=ContinuousDouble{opType=continuous, dataType=double, value=96.46775016719015}, class=ContinuousDouble{opType=continuous, dataType=double, value=0.0}, response=ContinuousDouble{opType=continuous, dataType=double, value=0.0}}
{segment=0, probability_0=0.8285, probability_1=0.1715, probability_2=0.0, predicted_segment=0}
------------------------------------------------------------------------------
{age=ContinuousDouble{opType=continuous, dataType=double, value=41.1319853711761}, income=ContinuousDouble{opType=continuous, dataType=double, value=137.81214021370113}, class=ContinuousDouble{opType=continuous, dataType=double, value=2.0}, response=ContinuousDouble{opType=continuous, dataType=double, value=1.0}}
{segment=2, probability_0=0.0, probability_1=0.0035, probability_2=0.9965, predicted_segment=2}
------------------------------------------------------------------------------
{age=ContinuousDouble{opType=continuous, dataType=double, value=48.015664108757235}, income=ContinuousDouble{opType=continuous, dataType=double, value=33.43913372384339}, class=ContinuousDouble{opType=continuous, dataType=double, value=1.0}, response=ContinuousDouble{opType=continuous, dataType=double, value=1.0}}
{segment=2, probability_0=0.0, probability_1=0.1715, probability_2=0.8285, predicted_segment=2}
------------------------------------------------------------------------------
```

Confidence can be extracted by matching with the predicted output label, *e.g.* for the second item above, `predicted_segment=0`, therefore the "confidence" is `probability_0=0.8285`.

