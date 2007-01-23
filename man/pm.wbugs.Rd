\name{pm.wbugs}
\alias{pm.wbugs}
\title{Run Pella-Masuda model via WinBUGS}
\description{
  Sets up the Pella-Masuda model and passes it to WinBUGS via R2WinBUGS}
}
\usage{
pm.wbugs(x,
n.iter=20000,  n.burnin=floor(n.iter/2),
n.chains=x$R,
n.thin=max(1, floor(n.chains * (n.iter - n.burnin)/1000)),
useWINE, WINE = Sys.getenv("WINE"), WINEPATH="",...)
}
\arguments{
  \item{x}{a mixstock data object}
    \item{n.iter}{Total length of each chain}
    \item{n.burnin}{Number of burn-in iterations}
    \item{n.chains}{Number of chains (default, number of sources)}
  \item{n.thin}{thinning rate.  Must be a positive integer. Set 'n.thin' > 1
    to save memory and computation time if 'n.iter' is large.
    Default is 'max(1, floor(n.chains * (n.iter-n.burnin) /
    1000))' which will only thin if there are at least 2000
    simulations.}
  \item{useWINE}{run WinBUGS via WINE on Linux?  Default is TRUE if WINE
    environment variable is set}
  \item{WINE}{location of WINE binary on Linux}
  \item{WINEPATH}{WINE directory on Linux}
  \item{\dots}{other arguments to \code{bugs}}
}
\value{
  a BUGS object (as returned from R2WinBUGS); can be converted to CODA
  format using \code{\link{as.mcmc.bugs}}
}
\author{Ben Bolker}
\seealso{\code{\link{tmcmc}}}
\examples{
data(bolten98)
\dontrun{
bolten98.wbugs <- pm.wbugs(bolten98,tot=1000,clearWD=TRUE)
bolten98.wbugs
}
}
\keyword{misc}