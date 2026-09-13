# Idris2-Topology

[![Idris 2 Verification](https://img.shields.io/badge/Idris_2-0.8.0-blue.svg)](https://www.idris-lang.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

**Layer 4 Discrete Cell Complex Topology, Chain Boundaries & Toroidal Homology for Idris 2**

`Idris2-Topology` forms **Layer 4** of the 10-layer constructive non-linear multiset science framework. It formalizes discrete cell complexes (`ChainCell n`), topological boundary operators (`boundary`), boundary-of-boundary zero identities ($\partial^2 = 0$), Narayana peak sifting over Dyck paths, and toroidal lattice homology rings.

---

## 📦 Core Library Architecture & Modules

### 1. `Math.Topology.Boundaries`
- **Discrete Cell Complexes:** Inductive cell dimensions (`ChainCell 0` vertices, `ChainCell 1` edges, `ChainCell 2` faces).
- **Boundary Operator ($\partial$):** Topological boundary mapping (`boundary`) sending $n$-cells to $(n-1)$-chains.
- **Topological Conservation Law ($\partial^2 = 0$):** Type-level proof witness that the boundary of a boundary is identically zero, guaranteeing closed flux loop containment without numerical grid leakage.

### 2. `Math.Topology.Narayana` & `Math.Topology.Peaks`
- **Dyck Path Peak Sifting:** Dyck contour walks and Narayana combinatorial peak counting over discrete cell complexes.
- **Topological Path Routing:** Combinatorial path routing over 2D and 3D toroidal lattice networks.

### 3. `Geometry.LatticeTopology`
- **Toroidal Lattice Homology:** Discrete cell complex homology rings, Betti numbers ($b_0, b_1, b_2$), and Euler characteristic calculations ($\chi = V - E + F$).

---

## 🚀 Building & Installing

```bash
idris2 --build Idris2-Topology.ipkg
idris2 --install Idris2-Topology.ipkg
```

---

## 🔬 Architectural Principles

- **Total Constructivism:** Enforces `%default total` across all topological boundary modules.
- **Closed Contour Conservation:** $\partial^2 = 0$ enforcing strict topological containment of charges and fluxes.
- **Zero Floating-Point Drift:** Combinatorial Dyck path peak sifting evaluated over exact rational numbers.
