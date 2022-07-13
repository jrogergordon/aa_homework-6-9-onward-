const Homework = "Intro to JS part 2, W8D2";
console.log(Homework);

const printCallback = function(bleep) {
    function func(item) {
        console.log(item)
    }
    
    bleep.forEach(func);
}

const titleize = function(arr, func) {
    const new_arr = [];
    function shovel(item) {
        new_arr << "Mx." + item + "Jingleheimer Schmidt";
    };
    Array.prototype.map = function(arr) {
        arr.forEach(item);
    }
    return new_arr;
}

console.log(titleize, printCallback)



