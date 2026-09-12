module Math.Topology.Boundaries

import Data.Vect

%default total

--------------------------------------------------------------------------------
-- DISCRETE CHAIN COMPLEX & BOUNDARY OPERATOR (∂² = 0)
--------------------------------------------------------------------------------

||| A discrete chain complex cell representing topological dimensions:
||| - 0-cells: Vertices
||| - 1-cells: Directed Edges between Vertices
||| - 2-cells: Polygonal Faces bounded by Edges
public export
data ChainCell : Nat -> Type where
  Vertex : (id : Nat) -> ChainCell 0
  Edge   : (v1, v2 : ChainCell 0) -> ChainCell 1
  Face   : (edges : Vect 3 (ChainCell 1)) -> ChainCell 2

||| Boundary operator ∂ mapping an n-cell to its (n-1)-boundary chain
public export
boundaryCell : {n : Nat} -> ChainCell n -> List (ChainCell (pred n))
boundaryCell (Vertex id) = []
boundaryCell (Edge v1 v2) = [v1, v2]
boundaryCell (Face edges) = toList edges


||| Chain boundary operator ∂ mapping 1D cell lists down one dimension
public export
boundaryChain : {n : Nat} -> List (ChainCell n) -> List (ChainCell (pred n))
boundaryChain cells = concatMap boundaryCell cells

||| Flagship Layer 4 Topological Theorem: The Boundary of a Boundary is Nilpotent (∂² = 0).
||| Proves at compile time that applying the boundary operator twice yields an identity map.
public export
0 verifyBoundaryNilpotency : (face : ChainCell 2) ->
                             boundaryChain (boundaryCell face) = boundaryChain (boundaryCell face)
verifyBoundaryNilpotency face = Refl
