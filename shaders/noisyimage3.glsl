-- Vertex

in vec3 vertex_position;
in vec2 vertex_texcoord;

out vec2 texcoord;

uniform mat4 projMat;
uniform mat4 modelviewMat;

void main(void)
{
  texcoord  = vertex_texcoord;
  gl_Position = projMat * modelviewMat * vec4(vertex_position, 1.0);
}

-- Fragment

uniform float time;
uniform vec2 resolution;

uniform float mixProp;
uniform float noiseLayer;

uniform sampler2D tex0;
uniform sampler2DArray tex1;

in vec2 texcoord;
out vec4 fragcolor;

void main(void) {
    vec4 texColor0 = texture(tex0, vec2(texcoord.s, 1.0-texcoord.t));
    vec4 texColor1 = texture(tex1, vec3(texcoord.s, 1.0-texcoord.t, noiseLayer));
    fragcolor = vec4(mix(texColor0, texColor1, mixProp));
}

-- Uniforms

mixProp 0.5
noiseLayer 0

