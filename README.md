# Building MatConvNet modules

This repo walks through how to organize your code as a module that can be 
easily shared with other [MatConvNet](https://github.com/vlfeat/matconvnet) 
users with the `vl_contrib` module manager (currently available on the 
[contrib](https://github.com/vlfeat/matconvnet/tree/contrib) branch of the main repo). 
As a demo, this example will create a minimal matconvnet layer (that takes an 
input and multiplies it by two) as a module named `mcn_module_demo`. 

Start off by creating a function called `vl_nnmulbytwo()` by putting it in a 
folder called `matlab` (you can take a look at the function 
[here](matlab/vl_nnmulbytwo.m)). Although it is not required, to help other 
users understand its operation we'll add an example usage 
to [example/demo.m](example/demo.m).

### Pure MATLAB modules

If your module contains only MATLAB (and therefore does not require compilation), all that 
is required to make your code usable for others it to create a script called 
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
to include unit tests for them. This can be done by mirroring the test folder 
structure of matconvnet (i.e. creating tests prefixed with `nn` in `xtest/suite/`). 
Add a file called at `xtest/suite/nnmulbytwo.m` add put a simple [derivative check](xtest/suite/nnmulbytwo.m) 
in there. 

### Sharing the module

To share your module, all that is required is to add the URL of your github 
repository to a page in a format that `vl_contrib` can understand.  By default,
it will look for modules listed on a centralized index.  However, you can specify 
your own list of repos to be searched by the module manager. 

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
