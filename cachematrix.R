## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}
#MakeCacheMatrix is a function that creates a special matrix object that will cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL 
        set <- function(y) { #changes the matrix stored in the main function
                x <<- y
                inv <<- NULL
        }
        get <- function() x #return matrix x stored in the main function.
        setinverse <- function(inverse) inv <<- inverse #set the value of the inverse
        getinverse <- function() inv#get the value of the inverse
        list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

#Sample test:
        #> m <- matrix(c(-3, -1, 1, 1), 2,2)
        # > x <- makeCacheMatrix(m)
#> x$get()
#      [,1] [,2]
#[1,]   -3    1
#[2,]   -1    1


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

#This function computes the inverse of the special matrix returned by makeCacheMatrix.
#It checks to see if the inverse was calculated.
#If so, the cacheSolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        inv <- x$getinverse()#gets the inverse of the special matrix
        if(!is.null(inv)) {
                message("getting cached data.")
                return(inv)
        }
        data <- x$get() #retrieves the matrix and places into data matrix
        inv <- solve(data) #calculates the inverse
        x$setinverse(inv)#stores the matrix inverse
        inv #returns the inv
}


#Sample test: 
        #> inv <- cacheSolve(x)
        # > inv
#      [,1] [,2]
#[1,]  -0.5  0.5
#[2,]  -0.5  1.5
        
#> inv <- cacheSolve(x)
#       getting cached data.
#> inv
#     [,1] [,2]
#[1,] -0.5  0.5
#[2,] -0.5  1.5
