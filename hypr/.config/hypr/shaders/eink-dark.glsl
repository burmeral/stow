#version 300 es
precision highp float;
in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

void main() {
    vec4 c = texture(tex, v_texcoord);
    float g = dot(c.rgb, vec3(0.2126, 0.7152, 0.0722));

    // invert: light backgrounds become dark, dark text becomes light
    g = 1.0 - g;

    // contrast curve
    g = clamp((g - 0.5) * 1.25 + 0.5, 0.0, 1.0);

    // posterize to 16 levels
    g = floor(g * 15.0 + 0.5) / 15.0;

    // tint
    vec3 paper = vec3(0.93, 0.91, 0.86);
    vec3 ink   = vec3(0.10, 0.10, 0.11);
    fragColor = vec4(mix(ink, paper, g), c.a);
}
