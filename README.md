# Building MatConvNet modules

This repo walks through how to organize your code as a module that can be 
easily shared with other [MatConvNet](https://github.com/vlfeat/matconvnet) 
users with the `vl_contrib` module manager (currently available on the 
[contrib](https://github.com/vlfeat/matconvnet/tree/contrib) branch of the main repo). 
We will create a matconvnet layer that takes an input and multiplies it by two and 
share this code as a module named `mcn_module_demo`. 

We'll start off by creating a function called `vl_nnmulbytwo()` by putting it in
a folder called `matlab` (you can take look at this exciting function 
[here](matlab/vl_nnmulbytwo.m)). To help other users understand its operation, we'll
add an example usage to [example/demo.m](example/demo.m) (this is not required, but 
it can be beneficial).

### Pure MATLAB modules

If your module consists solely of MATLAB (and therefore does not require 
compilation), all that is required is to create a script called 
`setup_<module-name>.m` in the root of your module directory.  Since our example 
only contains MATLAB, we create a file called [setup\_mcn\_module\_demo.m](setup_mcn_module_demo.m) 
which simply adds the `matlab` and `example` folders to the path.

For an example of a more sophisticated pure MATLAB module, take a look at 
[autonn](https://github.com/vlfeat/autonn).

### MATLAB + CPP/CUDA modules

To add a module which includes compiled code, you can additionally provide
a `compile_<modeule-name>.m` script.  An example of how to do this is provided
[here](https://github.com/lenck/mcn-example-module).

### Layer tests

If you are sharing implementations of layers, it is helpful (and reassuring)
to include unit tests for them. By providing a file called `test_<module-name>m`,
the user is able to run these tests with the `vl_contrib` function. In 
[test\_mcn\_module\_demo.m](), we call a helper function to check the derivatives of 
our layer.

### Sharing the module
