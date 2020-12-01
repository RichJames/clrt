# clrt
### Richard James <richjamespub1@gmail.com>_

This is a learning project to write a raytracer in Common Lisp.  I am following along with the Youtube tutorial by Alexander Lehmann at [Writing a Raytracer in Common Lisp - Part 1](https://www.youtube.com/watch?v=N1oMRw04W3E).

This code is largely the code that he creates over the course of the 4 part Youtube series.  I make a few minor changes, where I see fit, including building the project with Quicklisp, rather than straight ASDF.

## License
As this code is almost entirely Andrew Lehmann's original work, it is licensed under the same terms as his original code: Apache License, Version 2.0.  A copy of the license can be obtained at http://www.apache.org/licenses/LICENSE-2.0 .

Additionally, any use of this code must include acknowledgement of Andrew Lehmann and his original reposity located at https://github.com/afwlehmann/clrt-tutorial.

## Running the example

As mentioned above, I set it up so this can build with Quicklisp.  So, simply download this repository into your Quicklisp-defined project folder and then, at a REPL (I used SBCL):

```lisp
(ql:quickload :clrt)
(load "simple-scene")
(simple-scene:render)
```
This will produce a file, "test.png", that is a rendered scene of a sphere with a single light source. The
file, simple-scene.lisp, also defines a cube which you can use to create a scene with that.  The easiest way to see that is to comment out the line that adds the sphere to the scene and uncomment the line that adds the cube.

Of course, you can play around with this, positioning the sphere or cube or both in the scene, as well as move the light around.  You can also create more than one light and add it to the scene.

