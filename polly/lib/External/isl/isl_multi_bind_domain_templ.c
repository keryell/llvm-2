/*
 * Copyright 2018      Cerebras Systems
 *
 * Use of this software is governed by the MIT license
 *
 * Written by Sven Verdoolaege,
 * Cerebras Systems, 175 S San Antonio Rd, Los Altos, CA, USA
 */

#include <isl_multi_macro.h>

#undef TYPE
#define TYPE	MULTI(BASE)
#include <isl_bind_domain_templ.c>
