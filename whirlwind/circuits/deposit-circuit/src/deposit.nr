use dep::std::hash::pedersen_hash;
use dep::std::merkle::compute_merkle_root;

fn main(
    id: Field,
    r: Field,
    oldPath: [Field; 8],
    oldRoot: pub Field,
    newRoot: pub Field, 
    commitment: pub Field,
    index: pub Field
) {

    let computed_commitment = pedersen_hash([id, r]);
    assert(computed_commitment == commitment);

    let recomputed_old_root = compute_merkle_root(0x18d85f3de6dcd78b6ffbf5d8374433a5528d8e3bf2100df0b7bb43a4c59ebd63, index, oldPath);
    assert(oldRoot == recomputed_old_root);

    let recomputed_new_root = compute_merkle_root(commitment, index, oldPath);
    assert(newRoot == recomputed_new_root);
}
