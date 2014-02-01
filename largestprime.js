var isPrime = function(input) {
	for(i=2; i<input; i++){
		if(input%i===0){
			return false;
		}
	}
		return true;
};

var maxPrime = function(input) {
	bigPrime = 0;
	for(i=2; i<input; i++){
		if(input%i===0 && isPrime(i) ){
			bigPrime = i;
		}
	}	
	return bigPrime;
};

maxPrime(60085);