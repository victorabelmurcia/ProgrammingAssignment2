## the functions are prepared to create cachable matrix object. After using the first one we have a list of 4 functions.
## The second function computes the inverse of the matrix or take it from the cache if it was ran earlier.

## The first function prepares a cachable matrix object. It returns a list of four objects. It is an environment for the second fuction.


makeCacheMatrix <- function(x = matrix()) {
    s <- NULL  ## creating an object. Caching the matrix invers
    set <- function(y) { ## Creating a second function
        x <<- y  ## Saving new matrix
        s <<- NULL ## removing old inverse. "x" and "s" are stored in the parent directory of the setting function.
    }
    get <- function() x  ## Gives back the matrix "x"
    setsolve <- function(solve) s <<- solve ## "s" gets a new value
    getsolve <- function() s   ##  returns "s"
    list(set = set, get = get, ##  the output, a list containing it's functions. "s" and "x" are stored here.
         setsolve = setsolve,
         getsolve = getsolve)
}


##  The function inverts a matrix and caches or it just catches it's value. If it's catched then it also returns a message "getting cached data".


cacheSolve <- function(x, ...) {
    s <- x$getsolve()  ## gets cached inverse from the list getsolve
    if(!is.null(s)) {  
        message("getting cached data")  ## gives the messeage if the inverse from a matrix was catched.
        return(s)   ##  returns the inverse matrix
    }
    data <- x$get()  ##  gets the matrix for computetion (first function)
    s <- solve(data, ...)  ##  computes the invers of the matrix
    x$setsolve(s)  ##  gives the inverse back to the caching list-object
    s ##  prints the solution (inverse of the matrix)
    
}
