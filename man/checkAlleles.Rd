\name{checkAlleles}
\alias{checkAlleles}

\title{Identify markers with switched alleles}

\description{
  Identify markers whose alleles might have been switched by comparing
  the LOD score for linkage to all other autosomal markers with the
  original data to that when the alleles have been switched.
}

\usage{checkAlleles(cross, threshold=3, verbose)}

\arguments{
 \item{cross}{An object of class \code{cross}.  See
   \code{\link{read.cross}} for details.}
 \item{threshold}{Only an increase in maximum 2-point LOD of at least
   this amount will lead to a marker being flagged.}
 \item{verbose}{If TRUE and there are no markers above the threshold,
   print a message.}
}

\value{
  A data frame containing the flagged markers, having four columns: the
  marker name, chromosome ID, numeric index within chromosome, and the
  difference between the maximum two-point LOD score with the alleles
  switched to that from the original data.
}

\details{
  For each marker, we compare the maximum LOD score for the cases where
  the estimated recombination fraction > 0.5 to those where r.f. < 0.5.
  The function \code{\link{est.rf}} must first be run.

  \bold{Note}: Markers that are tightly linked to a marker whose alleles
  are switched are likely to also be flagged by this method.  The real
  problem markers are likely those with the biggest difference in LOD
  scores.
}


\author{Karl W Broman, \email{broman@wisc.edu} }

\examples{
data(fake.f2)
\dontshow{fake.f2 <- subset(fake.f2, chr="5")}

# switch homozygotes at marker D5M391
fake.f2 <- switchAlleles(fake.f2, "D5M391")

fake.f2 <- est.rf(fake.f2)
checkAlleles(fake.f2)
}

\seealso{ \code{\link{est.rf}}, \code{\link{geno.crosstab}}, \code{\link{switchAlleles}} }

\keyword{utilities}
