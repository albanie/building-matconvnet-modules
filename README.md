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
[test\_mcn\_module\_demo.m](test_mcn_module_demo.m), we call a helper function 
to check the derivatives of our layer implementation.

### Sharing the module

To share your module, all that is required is to add the URL of your github 
repository to a page in a format that `vl_contrib` can understand.  By default,
it will look for modules listed on this [page](https://github.com/lenck/matconvnet-contrib-test).
However, you can specify your own list of repos to be searched by the module 
manager. 

To illustrate, the URL of this repo has been added to a module list 
[here](https://github.com/albanie/matconvnet-contrib-test). Users can now 
install `mcn_module_demo` with `vl_contrib` by specifying the name of the 
module together with the URL of the module list.


To install (and test) `mcn_module_demo`, they can run the following sequence
of commands:

```
vl_contrib('install', 'mcn_module_demo', 'contribUrl', 'github.com/albanie/matconvnet-contrib-test/') ;
vl_contrib('setup', 'mcn_module_demo', 'contribUrl', 'github.com/albanie/matconvnet-contrib-test/') ;
vl_contrib('test', 'mcn_module_demo', 'contribUrl', 'github.com/albanie/matconvnet-contrib-test/') ;
```

The module should now be installed in `<matconvnet-dir/contrib/mcn_module_demo>`.
