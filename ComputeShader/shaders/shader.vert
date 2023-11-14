#version 450

layout (binding = 0) uniform ParameterUBO {
    float particleSize;
} vUbo;

layout(location = 0) in vec2 inPosition;
layout(location = 1) in vec2 inVelocity;

layout(location = 0) out vec3 fragColor;

void main() {

    gl_PointSize = vUbo.particleSize;
    gl_Position = vec4(inPosition.xy, 1.0, 1.0);
    const float velocity = length(inVelocity);
    const float maxVelocity = 0.001f;
    const float normalizedVelocity = clamp(velocity / maxVelocity, 0.f, 1.f);
    const float b = 1.f - abs(0.33f - normalizedVelocity) * 3.f;
    const float g = 1.f - abs(0.66f - normalizedVelocity) * 3.f;
    const float r = 1.f - abs(1.f - normalizedVelocity) * 3.f;
    fragColor = vec3(r, g, b);
}