use dep::std::hash::pedersen_hash;
use dep::std::merkle::compute_merkle_root;

fn main(
    r: Field,
    index: Field,
    path: [Field; 8],
    root: pub Field,
    id: pub Field
) {
    let nullifier = pedersen_hash([id, r]);

    let recomputed_root = compute_merkle_root(nullifier, index, path);

    assert(recomputed_root == root, "Merkle root mismatch");
    assert(nullifier == pedersen_hash([id, r]), "Nullifier mismatch");
}