## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
##
## This funcion creates a vector that includes
## the funcions to save and retieve the cached 
## inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL    ## set s in environment outside function set() 
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
  
}


## Write a short comment describing this function
##
## This function replaces the solved function by either
## retrieve the value from the cached vector of a matrix or 
## performs the solve funcion if it's not cached


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
  
  
  }
