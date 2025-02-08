package storage

type pageAllocator struct {
	freeList []uint64
	lastPage uint32
	pageSize uint16
}
