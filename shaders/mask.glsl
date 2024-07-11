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

in vec2 texcoord;
out vec4 fragcolor;

uniform sampler2D tex0;
uniform float Sigma;

void main() {
  float dx = texcoord.s-.5;
  float dy = texcoord.t-.5;
  float d = sqrt(dx*dx+dy*dy);

  // Gaussian with sd = Sigma, u = 0
  float scale = .3989423/Sigma;
  float t1 = -1.*d*d;
  float t2 = 2.*Sigma*Sigma;
  float alpha = exp(t1/t2) * scale;

  vec3 texColor = texture(tex0, vec2(texcoord.s, 1.0-texcoord.t)).rgb;
  fragcolor = vec4(texColor, alpha);  
}

-- Uniforms
Sigma 0.2

