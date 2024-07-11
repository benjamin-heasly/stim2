-- Vertex
precision mediump float;
in mediump vec3 vertex_position;
in mediump vec2 vertex_texcoord;

out mediump vec2 texcoord;

uniform mat4 projMat;
uniform mat4 modelviewMat;

void main(void)
{
  texcoord  = vertex_texcoord;
  gl_Position = projMat * modelviewMat * vec4(vertex_position, 1.0);
}

-- Fragment

uniform highp float time;
uniform mediump vec2 resolution;

uniform sampler2D tex0;
uniform sampler2D tex1;

uniform mediump float freq;
in mediump vec2 texcoord;
out mediump vec4 fragcolor;

mediump vec2 rand(mediump vec2 p){
   return fract(pow(p + 2.0, p.yx + 2.0) * 22222.0);
}


mediump vec2 rand2(mediump vec2 p){
   return rand(rand(p));
}


void main(void){
    mediump float mixprop = sin(6.28318530718*(time*freq));
    mediump vec3 texColor0 = texture(tex0, vec2(texcoord.s, 1.0-texcoord.t)).rgb;
    mediump vec3 texColor1 = texture(tex1, vec2(texcoord.s, 1.0-texcoord.t)).rgb;
    mediump vec2 p = (gl_FragCoord.xy * 2.0 - resolution.xy) / min(resolution.x, resolution.y);
    fragcolor = vec4(mix(texColor0, texColor1, mixprop), rand2(p - (sin(time) * 0.001)).x);
}

-- Uniforms
freq 0.5

