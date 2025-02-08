package storage

type bNode struct {
	data     []byte
	key      uint32
	keys     []uint32
	children []bNode
	isLeaf   bool
}

func newBNode(key uint32, isLeaf bool, data []byte) *bNode {
	return &bNode{
		key:    key,
		isLeaf: isLeaf,
	}
}
