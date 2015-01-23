
## With these couple of functions, we'll try not to do unnecessary
## calculations by mean of putting in cache the calculations already done.

## This function returns a vector of functions addressed to store 
## a matrix and its inverse.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y){
        x <<- y
        inv <<- NULL
    }
    get <- function(){
        x
    }
    setinv <- function(i){
        inv <<- i
    }
    getinv <- function(){
        inv
    }
    
    list(set = set, get = get, setinv = setinv, getinv = getinv)

}


## This function returns the inverse of a matrix through a variable
## set by the function "makeCacheMatrix" above. 
## When is called the first time, the calculation will be done.
## When is called the second time, the calculation won't be done again
## and will be simply printed.

 cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
     y <- x$getinv()
     if (!is.null(y)){
         message("getting cached data")
         return(y)
     }
     z <- solve(x$get())
     x$setinv(z)
     z
 }
