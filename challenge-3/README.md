# KPMG Challenge 3

We have a nested object, we would like a function that you pass in the object and a key and get back the value. How this is implemented is up to you.

Example Inputs
`object = {“a”:{“b”:{“c”:”d”}}}`
`key = a/b/c`

`object = {“x”:{“y”:{“z”:”a”}}}`
`key = x/y/z`
`value = a`

# My Solution

Again deciding to use Ruby to solve this problem. The function created accepts the key as a string in the given format and splits this into an array. Then splats this array into arguments for the hash.dig
