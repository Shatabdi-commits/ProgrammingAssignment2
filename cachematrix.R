## Put comments here that give an overall description of what your
## functions do
##makeCacheMatrix: This function creates a special “matrix” object that can cache its inverse.
## cacheSolve: This function computes the inverse of the special “matrix” returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed),
##then cacheSolve should retrieve the inverse from the cache.
## I  set the input x as a matrix
## and then set the solved value "s" as a null
## and changed every reference to "mean" to "solve"

makeCacheMatrix <- function(x = matrix()) {
        j <- NULL
  set <- function(y){
  x <<- y
  j <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) j <<- inverse
  getInverse <- function() j 
  list(set = set, get = get, 
  setInverse = setInverse, 
  getInverse = getInverse)

}


## Write a short comment describing this function
##Computing the inverse of a square matrix can be done with the solve function in R. For example, if X is a square invertible matrix, then solve(X) returns its inverse.
## Same here, changed "mean" to "solve" and "m" to "s"
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
  j <- x$getInverse()
  if(!is.null(j)){
  message("getting cached data")
  return(j)
  }
  mat <- x$get()
  j <- solve(mat,...)
  x$setInverse(j)
  j
}
