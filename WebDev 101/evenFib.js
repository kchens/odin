//calculate fibbonacci under 4 million
//find even numbers
//sum even numbers

var arr = [];
var sum = 0;

var fibonacci = function(num){
	for(i=0; i<num; i++){
		if (arr.length<2){
			arr.push(i+1);
		}
		else {
		arr.push(arr[i-1] + arr[i-2]);
		}
	}
	console.log(arr);
};

var even = function(fib) {
	for(i=0; i<fib.length; i++){
		if(fib[i]%2 === 0){
			sum+=fib[i];
		}
	}
	console.log(sum);
};

fibonacci(10);
even(arr);



///combine the two


var fibonacciEven = function(num){
	var arr = [1,2,3];
	var sum = 0;
	var length = arr.length;

	while(arr[length-1]<=num){
		arr.push(arr[length-1] + arr[length-2]);
		length = arr.length;
	}
 
 	console.log(arr);
    for(i=0; i<length; i++){
		if(arr[i]%2 === 0){
			sum+=arr[i];
		}
	}
	console.log(sum);
    
};

fibonacciEven(10);
