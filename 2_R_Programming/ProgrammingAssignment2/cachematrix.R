##This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  setMatrix <- function(y) {
    x <<- y
    i <<- NULL
  }
  getMatrix <<- function() {x}
  setInverse <- function(inv) {i <<- inv}
  getInverse <- function() {i}
  list(get=getMatrix,set=setMatrix,getInverse=getInverse,setInverse=setInverse)
}


## Calculates the inverse of x

cacheSolve <- function(x, ...) {
  i <- x$getInverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  inv <- solve(data)
  x$setInverse(inv)
  inv
}
