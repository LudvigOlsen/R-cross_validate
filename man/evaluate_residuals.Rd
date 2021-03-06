% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/evaluate_residuals.R
\name{evaluate_residuals}
\alias{evaluate_residuals}
\title{Evaluate residuals from a regression task}
\usage{
evaluate_residuals(data, target_col, prediction_col, metrics = list())
}
\arguments{
\item{data}{\code{data.frame} with predictions and targets.}

\item{target_col}{Name of the column with the true values in \code{`data`}.}

\item{prediction_col}{Name of column with the predicted values in \code{`data`}.}

\item{metrics}{\code{list} for enabling/disabling metrics.

  E.g. \code{list("RMSE" = FALSE)} would disable \code{RMSE}.
  Default values (\code{TRUE}/\code{FALSE}) will be used for the remaining available metrics.

  You can enable/disable all metrics at once by including
  \code{"all" = TRUE/FALSE} in the \code{list}. This is done prior to enabling/disabling
  individual metrics, why for instance \code{list("all" = FALSE, "RMSE" = TRUE)}
  would return only the \code{RMSE} metric.

  The \code{list} can be created with
  \code{\link[cvms:gaussian_metrics]{gaussian_metrics()}}.

  Also accepts the string \code{"all"}.}
}
\value{
\code{tibble} \code{data.frame} with the calculated metrics.

 The following metrics are available (see \code{`metrics`}):

 \tabular{rrr}{
  \strong{Metric} \tab \strong{Name} \tab \strong{Default} \cr
  Mean Absolute Error \tab "MAE" \tab Enabled \cr
  Root Mean Square Error \tab "RMSE" \tab Enabled \cr
  Normalized RMSE (by target range) \tab "NRMSE(RNG)" \tab Disabled \cr
  Normalized RMSE (by target IQR) \tab "NRMSE(IQR)" \tab Enabled \cr
  Normalized RMSE (by target STD) \tab "NRMSE(STD)" \tab Disabled \cr
  Normalized RMSE (by target mean) \tab "NRMSE(AVG)" \tab Disabled \cr
  Relative Squared Error \tab "RSE" \tab Disabled \cr
  Root Relative Squared Error \tab "RRSE" \tab Enabled \cr
  Relative Absolute Error \tab "RAE" \tab Enabled \cr
  Root Mean Squared Log Error \tab "RMSLE" \tab Enabled \cr
  Mean Absolute Log Error \tab "MALE" \tab Disabled \cr
  Mean Absolute Percentage Error \tab "MAPE" \tab Disabled \cr
  Mean Squared Error \tab "MSE" \tab Disabled \cr
  Total Absolute Error \tab "TAE" \tab Disabled \cr
  Total Squared Error \tab "TSE" \tab Disabled \cr
 }

 The \strong{Name} column refers to the name used in the package.
 This is the name in the output and when enabling/disabling in \code{`metrics`}.
}
\description{
\Sexpr[results=rd, stage=render]{lifecycle::badge("experimental")}

 Calculates a large set of error metrics from regression residuals.

 \strong{Note}: In most cases you should use \code{\link[cvms:evaluate]{evaluate()}} instead.
 It works in \code{magrittr} pipes (e.g. \code{\%>\%}) and with
 \code{\link[dplyr:group_by]{dplyr::group_by()}}.
 \code{evaluate_residuals()} is more lightweight and may be preferred in
 programming when you don't need the extra stuff
 in \code{\link[cvms:evaluate]{evaluate()}}.
}
\details{
The metric formulas are listed in \emph{`The Available Metrics`} vignette.
}
\examples{
# Attach packages
library(cvms)

data <- data.frame(
  "targets" = rnorm(100, 14.7, 3.6),
  "predictions" = rnorm(100, 13.2, 4.6)
)

evaluate_residuals(
  data = data,
  target_col = "targets",
  prediction_col = "predictions"
)
}
\seealso{
Other evaluation functions: 
\code{\link{binomial_metrics}()},
\code{\link{confusion_matrix}()},
\code{\link{evaluate}()},
\code{\link{gaussian_metrics}()},
\code{\link{multinomial_metrics}()}
}
\author{
Ludvig Renbo Olsen, \email{r-pkgs@ludvigolsen.dk}
}
\concept{evaluation functions}
