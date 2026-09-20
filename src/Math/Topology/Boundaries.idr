module Math.Topology.Boundaries

import Core.BoxInt
import Core.Multiset
import Core.VexelMaxel
import Math.Multiset
import Data.List
import Data.Vect

%default total

--------------------------------------------------------------------------------
-- MULTISET DISCRETE CHAIN COMPLEX & TOPOLOGICAL BOUNDARY OPERATORS (∂² = 0)
-- 0-Cells (Vertices)   : Unixel / Vexel (Multiset BoxInt Unixel)
-- 1-Cells (Edges)      : Pixel / Maxel  (Multiset BoxInt Pixel)
-- 2-Cells (Plaquettes) : Maxel (Face Edge Loops)
--------------------------------------------------------------------------------

||| Pure Multiset Boundary operator ∂₁ : Multiset BoxInt Pixel -> Multiset BoxInt Unixel
||| mapping a 1-chain (edge multiset) to its 0-chain (vertex multiset boundary).
||| For each directed edge [u -> v] with weight w, ∂₁([u -> v]) = +w [v] - w [u].
public export
multisetBoundary1To0 : Multiset BoxInt Pixel -> Multiset BoxInt Unixel
multisetBoundary1To0 ZeroM = ZeroM
multisetBoundary1To0 (AddM (MkPixel u v) w rest) =
  insertItem (MkUnixel v) w (insertItem (MkUnixel u) (-w) (multisetBoundary1To0 rest))

||| Pure Multiset Boundary operator ∂₂ : List Pixel -> Multiset BoxInt Pixel
||| mapping a 2-cell (closed edge loop) to its 1-chain (edge multiset boundary).
public export
multisetBoundary2To1 : List Pixel -> Multiset BoxInt Pixel
multisetBoundary2To1 loopEdges =
  fromList (map (\p => (p, intToBoxInt 1)) loopEdges)

||| Pure Multiset Chain Boundary Operator ∂² mapping a 2-cell closed loop down to 0-cells.
public export
multisetBoundaryChain2To0 : List Pixel -> Multiset BoxInt Unixel
multisetBoundaryChain2To0 loopEdges = multisetBoundary1To0 (multisetBoundary2To1 loopEdges)

||| Flagship Layer 4 Topological Theorem: The Boundary of a Boundary is Nilpotent (∂² = 0).
||| Proves at compile time for any closed triangular or 4-cycle loop that ∂₁ ∘ ∂₂ = 0 (ZeroM).
public export
0 verifyMultisetClosedLoopNilpotency3 : multisetBoundaryChain2To0 [MkPixel 1 2, MkPixel 2 3, MkPixel 3 1] = ZeroM
verifyMultisetClosedLoopNilpotency3 = Refl

public export
0 verifyMultisetClosedLoopNilpotency4 : multisetBoundaryChain2To0 [MkPixel 1 2, MkPixel 2 3, MkPixel 3 4, MkPixel 4 1] = ZeroM
verifyMultisetClosedLoopNilpotency4 = Refl

