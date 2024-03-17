const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0A121B", /* black   */
  [1] = "#056F93", /* red     */
  [2] = "#039AA5", /* green   */
  [3] = "#02C2BC", /* yellow  */
  [4] = "#02A4D2", /* blue    */
  [5] = "#01AFEE", /* magenta */
  [6] = "#01D3D2", /* cyan    */
  [7] = "#77e8e1", /* white   */

  /* 8 bright colors */
  [8]  = "#53a29d",  /* black   */
  [9]  = "#056F93",  /* red     */
  [10] = "#039AA5", /* green   */
  [11] = "#02C2BC", /* yellow  */
  [12] = "#02A4D2", /* blue    */
  [13] = "#01AFEE", /* magenta */
  [14] = "#01D3D2", /* cyan    */
  [15] = "#77e8e1", /* white   */

  /* special colors */
  [256] = "#0A121B", /* background */
  [257] = "#77e8e1", /* foreground */
  [258] = "#77e8e1",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
