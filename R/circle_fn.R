circle_fn<-function (x, y, radius, nv = 100, border = NULL, col = NA, lty = 1, 
          lwd = 1) 
{
  xylim <- par("usr")
  plotdim <- par("pin")
  ymult <- (xylim[4] - xylim[3])/(xylim[2] - xylim[1]) * plotdim[1]/plotdim[2]
  angle.inc <- 2 * pi/nv
  angles <- seq(0, 2 * pi - angle.inc, by = angle.inc)
  if (length(col) < length(radius)) 
    col <- rep(col, length.out = length(radius))
  for (circle in 1:length(radius)) {
    xv <- cos(angles) * radius[circle] + x
    yv <- sin(angles) * radius[circle] * ymult + y
    polygon(xv, yv, border = border, col = col[circle], 
            lty = lty, lwd = lwd)
  }
  invisible(list(x = xv, y = yv))
}
