from __future__ import annotations
import hashlib
import math

def embed_text(text: str, dimensions: int = 64) -> list[float]:
    buckets = [0.0 for _ in range(dimensions)]
    for word in text.lower().split():
        digest = hashlib.sha256(word.encode("utf-8")).digest()
        idx = digest[0] % dimensions
        sign = 1.0 if digest[1] % 2 == 0 else -1.0
        buckets[idx] += sign
    norm = math.sqrt(sum(x * x for x in buckets)) or 1.0
    return [x / norm for x in buckets]

def cosine_similarity(a: list[float], b: list[float]) -> float:
    if len(a) != len(b):
        raise ValueError("Vectors must have same dimensions")
    return sum(x * y for x, y in zip(a, b))
