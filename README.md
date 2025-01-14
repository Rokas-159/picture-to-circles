# Picture to Circles - How to Use

## About

This is a [Processing](https://processing.org) project. It can be opened, used and compiled to other formats using Processing.

It is used to convert simple images into an images that are made out of a bunch of one-color circles put one on another.

## Converting a picture

To convert a picture, change the image path in the 20th line of `picture_to_circles.pde` to your desired picture. Change the size numbers in the 19th line to match your picture's dimensions. Then just run the application and the picture will be converted. It will be displayed on the screen and saved as a `.jpg` file inside the project directory as well.

## How the output works

The program generates a bunch of evenly spaced horizontal lines containing a bunch of evenly spaced circles. To not be repetetive, the circles are shifted in random directions by small random offsets, that can be edited with variables.

### Variables

At the beginning of `picture_to_circles.pde` there are some variables that can be changed to manipulate the output. Here are the variables explained:

- `CIRCLE_RADIUS` the radius of the circles in pixels.
- `GAP_X` the horizontal distance between the centers of adjacent circles in a horizontal line in pixels.
- `GAP_Y` the vertical distance between the centers of circles in adjacent lines in pixels.
- `X_OFFSET` the maximum distance the circle can be randomly shifted horizontally in pixels.
- `Y_OFFSET` the maximum distance the circle can be randomly shifted vertically in pixels.
- `INTERCHANGE` defines the rule of aligning the lines horizontally. If false - they are aligned randomly. If true - they are aligned interchangeably like fish scales.
