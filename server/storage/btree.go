package storage

type TreeConfig struct {
	pageSize   uint32
	keySize    uint16
	valueSize  uint16
	degree     uint32
	comparator uint8
}

func NewTreeConfig(degree uint32) *TreeConfig {
	treeCfg := &TreeConfig{}
	if treeCfg.degree == 0 {
		treeCfg.degree = 3
	}
	return treeCfg
}

func (tc *TreeConfig) calculateDegree() uint32 {
	return 0
}

type TreeMetaData struct {
	height     uint32
	nodeCount  uint32
	rootOffset uint32
}

type BTree interface {
	Insert(key []byte, data []byte) error
	Get(key []byte) ([]byte, error)
	Delete(key []byte) error
}

type bTreeImpl struct {
	root     *bNode
	metaData *TreeMetaData
	config   *TreeConfig
}

func NewBTree(treeCfg *TreeConfig) BTree {
	return &bTreeImpl{
		metaData: &TreeMetaData{
			height:     0,
			nodeCount:  1,
			rootOffset: 1,
		},
		config: treeCfg,
	}
}

func (bt *bTreeImpl) Insert(key []byte, data []byte) error {
	return nil
}

func (bt *bTreeImpl) Get(key []byte) ([]byte, error) {
	return nil, nil
}

func (bt *bTreeImpl) Delete(key []byte) error {
	return nil
}
