static const char norm_fg[] = "#77e8e1";
static const char norm_bg[] = "#0A121B";
static const char norm_border[] = "#53a29d";

static const char sel_fg[] = "#77e8e1";
static const char sel_bg[] = "#039AA5";
static const char sel_border[] = "#77e8e1";

static const char urg_fg[] = "#77e8e1";
static const char urg_bg[] = "#056F93";
static const char urg_border[] = "#056F93";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
