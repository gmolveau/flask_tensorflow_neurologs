╡╨
ь$╧$
T
AddN
inputs"T*N
sum"T"
Nint(0"
Ttype:
2	АР
h
All	
input

reduction_indices"Tidx

output
"
	keep_dimsbool( "
Tidxtype0:
2	
Ш
ArgMax

input"T
	dimension"Tidx
output"output_type"
Ttype:
2	"
Tidxtype0:
2	"
output_typetype0	:
2	
╢
AsString

input"T

output"
Ttype:
	2	
"
	precisionint         "

scientificbool( "
shortestbool( "
widthint         "
fillstring 
P
Assert
	condition
	
data2T"
T
list(type)(0"
	summarizeintИ
x
Assign
ref"TА

value"T

output_ref"TА"	
Ttype"
validate_shapebool("
use_lockingbool(Ш
{
BiasAdd

value"T	
bias"T
output"T"
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
A
Equal
x"T
y"T
z
"
Ttype:
2	
Р
W

ExpandDims

input"T
dim"Tdim
output"T"	
Ttype"
Tdimtype0:
2	
М
Gather
params"Tparams
indices"Tindices
output"Tparams"
validate_indicesbool("
Tparamstype"
Tindicestype:
2	
?
GreaterEqual
x"T
y"T
z
"
Ttype:
2		
б
HashTableV2
table_handle"
	containerstring "
shared_namestring "!
use_node_name_sharingbool( "
	key_dtypetype"
value_dtypetypeИ
.
Identity

input"T
output"T"	
Ttype
b
InitializeTableV2
table_handle
keys"Tkey
values"Tval"
Tkeytype"
TvaltypeИ
w
LookupTableFindV2
table_handle
keys"Tin
default_value"Tout
values"Tout"
Tintype"
TouttypeИ
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(И

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
я
ParseExample

serialized	
names
sparse_keys*Nsparse

dense_keys*Ndense
dense_defaults2Tdense
sparse_indices	*Nsparse
sparse_values2sparse_types
sparse_shapes	*Nsparse
dense_values2Tdense"
Nsparseint("
Ndenseint("%
sparse_types
list(type)(:
2	"
Tdense
list(type)(:
2	"
dense_shapeslist(shape)(
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
К
Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( "
Ttype:
2	"
Tidxtype0:
2	
`
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx"
Tidxtype0:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
/
Sigmoid
x"T
y"T"
Ttype:	
2
a
Slice

input"T
begin"Index
size"Index
output"T"	
Ttype"
Indextype:
2	
8
Softmax
logits"T
softmax"T"
Ttype:
2
╖
SparseFillEmptyRows
indices	
values"T
dense_shape	
default_value"T
output_indices	
output_values"T
empty_row_indicator

reverse_index_map	"	
Ttype
h
SparseReshape
input_indices	
input_shape	
	new_shape	
output_indices	
output_shape	
А
SparseSegmentSum	
data"T
indices"Tidx
segment_ids
output"T"
Ttype:
2		"
Tidxtype0:
2	
Ў
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
G
StringToHashBucketFast	
input

output	"
num_bucketsint(0
c
Tile

input"T
	multiples"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	
P
Unique
x"T
y"T
idx"out_idx"	
Ttype"
out_idxtype0:
2	
s

VariableV2
ref"dtypeА"
shapeshape"
dtypetype"
	containerstring "
shared_namestring И

Where	
input
	
index	
&
	ZerosLike
x"T
y"T"	
Ttype"serve*1.4.02
b'unknown'нь

global_step/Initializer/zerosConst*
value	B	 R *
dtype0	*
_class
loc:@global_step*
_output_shapes
: 
П
global_step
VariableV2*
shape: *
dtype0	*
	container *
shared_name *
_class
loc:@global_step*
_output_shapes
: 
▓
global_step/AssignAssignglobal_stepglobal_step/Initializer/zeros*
T0	*
validate_shape(*
use_locking(*
_class
loc:@global_step*
_output_shapes
: 
j
global_step/readIdentityglobal_step*
T0	*
_class
loc:@global_step*
_output_shapes
: 
o
input_example_tensorPlaceholder*
dtype0*
shape:         *#
_output_shapes
:         
b
ParseExample/ParseExample/namesConst*
valueB *
dtype0*
_output_shapes
: 
s
'ParseExample/ParseExample/sparse_keys_0Const*
valueB Bauth_method*
dtype0*
_output_shapes
: 
o
'ParseExample/ParseExample/sparse_keys_1Const*
valueB Bcountry*
dtype0*
_output_shapes
: 
t
'ParseExample/ParseExample/sparse_keys_2Const*
valueB Binvalid_user*
dtype0*
_output_shapes
: 
j
'ParseExample/ParseExample/sparse_keys_3Const*
value
B Bip*
dtype0*
_output_shapes
: 
p
'ParseExample/ParseExample/sparse_keys_4Const*
valueB Bprovider*
dtype0*
_output_shapes
: 
o
'ParseExample/ParseExample/sparse_keys_5Const*
valueB Bsuccess*
dtype0*
_output_shapes
: 
p
'ParseExample/ParseExample/sparse_keys_6Const*
valueB Busername*
dtype0*
_output_shapes
: 
М
ParseExample/ParseExampleParseExampleinput_example_tensorParseExample/ParseExample/names'ParseExample/ParseExample/sparse_keys_0'ParseExample/ParseExample/sparse_keys_1'ParseExample/ParseExample/sparse_keys_2'ParseExample/ParseExample/sparse_keys_3'ParseExample/ParseExample/sparse_keys_4'ParseExample/ParseExample/sparse_keys_5'ParseExample/ParseExample/sparse_keys_6*
Nsparse*
Ndense *
sparse_types
	2*
Tdense
 *
dense_shapes
 *о
_output_shapesЫ
Ш:         :         :         :         :         :         :         :         :         :         :         :         :         :         :::::::
Т
8linear/linear_model/auth_method/auth_method_lookup/ConstConst*&
valueBBssh_keyBpassword*
dtype0*
_output_shapes
:
y
7linear/linear_model/auth_method/auth_method_lookup/SizeConst*
value	B :*
dtype0*
_output_shapes
: 
А
>linear/linear_model/auth_method/auth_method_lookup/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
А
>linear/linear_model/auth_method/auth_method_lookup/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
в
8linear/linear_model/auth_method/auth_method_lookup/rangeRange>linear/linear_model/auth_method/auth_method_lookup/range/start7linear/linear_model/auth_method/auth_method_lookup/Size>linear/linear_model/auth_method/auth_method_lookup/range/delta*

Tidx0*
_output_shapes
:
░
:linear/linear_model/auth_method/auth_method_lookup/ToInt64Cast8linear/linear_model/auth_method/auth_method_lookup/range*

SrcT0*

DstT0	*
_output_shapes
:
╔
=linear/linear_model/auth_method/auth_method_lookup/hash_tableHashTableV2*
	container *
shared_name *
use_node_name_sharing( *
	key_dtype0*
value_dtype0	*
_output_shapes
: 
О
Clinear/linear_model/auth_method/auth_method_lookup/hash_table/ConstConst*
valueB	 R
         *
dtype0	*
_output_shapes
: 
к
Hlinear/linear_model/auth_method/auth_method_lookup/hash_table/table_initInitializeTableV2=linear/linear_model/auth_method/auth_method_lookup/hash_table8linear/linear_model/auth_method/auth_method_lookup/Const:linear/linear_model/auth_method/auth_method_lookup/ToInt64*

Tkey0*

Tval0	
г
1linear/linear_model/auth_method/hash_table_LookupLookupTableFindV2=linear/linear_model/auth_method/auth_method_lookup/hash_tableParseExample/ParseExample:7Clinear/linear_model/auth_method/auth_method_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:         
Д
*linear/linear_model/auth_method/Shape/CastCastParseExample/ParseExample:14*

SrcT0	*

DstT0*
_output_shapes
:
}
3linear/linear_model/auth_method/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:

5linear/linear_model/auth_method/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:

5linear/linear_model/auth_method/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
Ю
-linear/linear_model/auth_method/strided_sliceStridedSlice*linear/linear_model/auth_method/Shape/Cast3linear/linear_model/auth_method/strided_slice/stack5linear/linear_model/auth_method/strided_slice/stack_15linear/linear_model/auth_method/strided_slice/stack_2*
T0*
Index0*

begin_mask *
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
_output_shapes
: 
s
(linear/linear_model/auth_method/Cast/x/1Const*
valueB :
         *
dtype0*
_output_shapes
: 
┴
&linear/linear_model/auth_method/Cast/xPack-linear/linear_model/auth_method/strided_slice(linear/linear_model/auth_method/Cast/x/1*
N*
T0*

axis *
_output_shapes
:
И
$linear/linear_model/auth_method/CastCast&linear/linear_model/auth_method/Cast/x*

SrcT0*

DstT0	*
_output_shapes
:
╠
-linear/linear_model/auth_method/SparseReshapeSparseReshapeParseExample/ParseExampleParseExample/ParseExample:14$linear/linear_model/auth_method/Cast*-
_output_shapes
:         :
г
6linear/linear_model/auth_method/SparseReshape/IdentityIdentity1linear/linear_model/auth_method/hash_table_Lookup*
T0	*#
_output_shapes
:         
╪
@linear/linear_model/auth_method/weights/part_0/Initializer/zerosConst*
valueB*    *
dtype0*A
_class7
53loc:@linear/linear_model/auth_method/weights/part_0*
_output_shapes

:
х
.linear/linear_model/auth_method/weights/part_0
VariableV2*
shape
:*
dtype0*
	container *
shared_name *A
_class7
53loc:@linear/linear_model/auth_method/weights/part_0*
_output_shapes

:
╞
5linear/linear_model/auth_method/weights/part_0/AssignAssign.linear/linear_model/auth_method/weights/part_0@linear/linear_model/auth_method/weights/part_0/Initializer/zeros*
T0*
validate_shape(*
use_locking(*A
_class7
53loc:@linear/linear_model/auth_method/weights/part_0*
_output_shapes

:
█
3linear/linear_model/auth_method/weights/part_0/readIdentity.linear/linear_model/auth_method/weights/part_0*
T0*A
_class7
53loc:@linear/linear_model/auth_method/weights/part_0*
_output_shapes

:
В
8linear/linear_model/auth_method/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
Б
7linear/linear_model/auth_method/weighted_sum/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
С
2linear/linear_model/auth_method/weighted_sum/SliceSlice/linear/linear_model/auth_method/SparseReshape:18linear/linear_model/auth_method/weighted_sum/Slice/begin7linear/linear_model/auth_method/weighted_sum/Slice/size*
T0	*
Index0*
_output_shapes
:
|
2linear/linear_model/auth_method/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:
▀
1linear/linear_model/auth_method/weighted_sum/ProdProd2linear/linear_model/auth_method/weighted_sum/Slice2linear/linear_model/auth_method/weighted_sum/Const*
	keep_dims( *
T0	*

Tidx0*
_output_shapes
: 
}
;linear/linear_model/auth_method/weighted_sum/Gather/indicesConst*
value	B :*
dtype0*
_output_shapes
: 
·
3linear/linear_model/auth_method/weighted_sum/GatherGather/linear/linear_model/auth_method/SparseReshape:1;linear/linear_model/auth_method/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
▌
3linear/linear_model/auth_method/weighted_sum/Cast/xPack1linear/linear_model/auth_method/weighted_sum/Prod3linear/linear_model/auth_method/weighted_sum/Gather*
N*
T0	*

axis *
_output_shapes
:
П
:linear/linear_model/auth_method/weighted_sum/SparseReshapeSparseReshape-linear/linear_model/auth_method/SparseReshape/linear/linear_model/auth_method/SparseReshape:13linear/linear_model/auth_method/weighted_sum/Cast/x*-
_output_shapes
:         :
╡
Clinear/linear_model/auth_method/weighted_sum/SparseReshape/IdentityIdentity6linear/linear_model/auth_method/SparseReshape/Identity*
T0	*#
_output_shapes
:         
}
;linear/linear_model/auth_method/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
∙
9linear/linear_model/auth_method/weighted_sum/GreaterEqualGreaterEqualClinear/linear_model/auth_method/weighted_sum/SparseReshape/Identity;linear/linear_model/auth_method/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:         
Я
2linear/linear_model/auth_method/weighted_sum/WhereWhere9linear/linear_model/auth_method/weighted_sum/GreaterEqual*'
_output_shapes
:         
Н
:linear/linear_model/auth_method/weighted_sum/Reshape/shapeConst*
valueB:
         *
dtype0*
_output_shapes
:
ы
4linear/linear_model/auth_method/weighted_sum/ReshapeReshape2linear/linear_model/auth_method/weighted_sum/Where:linear/linear_model/auth_method/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:         
С
5linear/linear_model/auth_method/weighted_sum/Gather_1Gather:linear/linear_model/auth_method/weighted_sum/SparseReshape4linear/linear_model/auth_method/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:         
Ц
5linear/linear_model/auth_method/weighted_sum/Gather_2GatherClinear/linear_model/auth_method/weighted_sum/SparseReshape/Identity4linear/linear_model/auth_method/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:         
д
5linear/linear_model/auth_method/weighted_sum/IdentityIdentity<linear/linear_model/auth_method/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
И
Flinear/linear_model/auth_method/weighted_sum/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
╖
Tlinear/linear_model/auth_method/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRows5linear/linear_model/auth_method/weighted_sum/Gather_15linear/linear_model/auth_method/weighted_sum/Gather_25linear/linear_model/auth_method/weighted_sum/IdentityFlinear/linear_model/auth_method/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:         :         :         :         
й
Xlinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
л
Zlinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
л
Zlinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
щ
Rlinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceTlinear/linear_model/auth_method/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsXlinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse/strided_slice/stackZlinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Zlinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
T0	*
Index0*

begin_mask*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*#
_output_shapes
:         
т
Ilinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse/CastCastRlinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*

DstT0*#
_output_shapes
:         
∙
Klinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse/UniqueUniqueVlinear/linear_model/auth_method/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*
out_idx0*2
_output_shapes 
:         :         
Д
Ulinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse/embedding_lookupGather3linear/linear_model/auth_method/weights/part_0/readKlinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*A
_class7
53loc:@linear/linear_model/auth_method/weights/part_0*'
_output_shapes
:         
З
Dlinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparseSparseSegmentSumUlinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse/embedding_lookupMlinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse/Unique:1Ilinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse/Cast*
T0*

Tidx0*'
_output_shapes
:         
Н
<linear/linear_model/auth_method/weighted_sum/Reshape_1/shapeConst*
valueB"       *
dtype0*
_output_shapes
:
Ч
6linear/linear_model/auth_method/weighted_sum/Reshape_1ReshapeVlinear/linear_model/auth_method/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2<linear/linear_model/auth_method/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:         
╢
2linear/linear_model/auth_method/weighted_sum/ShapeShapeDlinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
К
@linear/linear_model/auth_method/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
М
Blinear/linear_model/auth_method/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
М
Blinear/linear_model/auth_method/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
┌
:linear/linear_model/auth_method/weighted_sum/strided_sliceStridedSlice2linear/linear_model/auth_method/weighted_sum/Shape@linear/linear_model/auth_method/weighted_sum/strided_slice/stackBlinear/linear_model/auth_method/weighted_sum/strided_slice/stack_1Blinear/linear_model/auth_method/weighted_sum/strided_slice/stack_2*
T0*
Index0*

begin_mask *
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
_output_shapes
: 
v
4linear/linear_model/auth_method/weighted_sum/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
ц
2linear/linear_model/auth_method/weighted_sum/stackPack4linear/linear_model/auth_method/weighted_sum/stack/0:linear/linear_model/auth_method/weighted_sum/strided_slice*
N*
T0*

axis *
_output_shapes
:
Є
1linear/linear_model/auth_method/weighted_sum/TileTile6linear/linear_model/auth_method/weighted_sum/Reshape_12linear/linear_model/auth_method/weighted_sum/stack*
T0
*

Tmultiples0*0
_output_shapes
:                  
╝
7linear/linear_model/auth_method/weighted_sum/zeros_like	ZerosLikeDlinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:         
Ъ
,linear/linear_model/auth_method/weighted_sumSelect1linear/linear_model/auth_method/weighted_sum/Tile7linear/linear_model/auth_method/weighted_sum/zeros_likeDlinear/linear_model/auth_method/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:         
а
3linear/linear_model/auth_method/weighted_sum/Cast_1Cast/linear/linear_model/auth_method/SparseReshape:1*

SrcT0	*

DstT0*
_output_shapes
:
Д
:linear/linear_model/auth_method/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:
Г
9linear/linear_model/auth_method/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
Ы
4linear/linear_model/auth_method/weighted_sum/Slice_1Slice3linear/linear_model/auth_method/weighted_sum/Cast_1:linear/linear_model/auth_method/weighted_sum/Slice_1/begin9linear/linear_model/auth_method/weighted_sum/Slice_1/size*
T0*
Index0*
_output_shapes
:
а
4linear/linear_model/auth_method/weighted_sum/Shape_1Shape,linear/linear_model/auth_method/weighted_sum*
T0*
out_type0*
_output_shapes
:
Д
:linear/linear_model/auth_method/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
М
9linear/linear_model/auth_method/weighted_sum/Slice_2/sizeConst*
valueB:
         *
dtype0*
_output_shapes
:
Ь
4linear/linear_model/auth_method/weighted_sum/Slice_2Slice4linear/linear_model/auth_method/weighted_sum/Shape_1:linear/linear_model/auth_method/weighted_sum/Slice_2/begin9linear/linear_model/auth_method/weighted_sum/Slice_2/size*
T0*
Index0*
_output_shapes
:
z
8linear/linear_model/auth_method/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
Я
3linear/linear_model/auth_method/weighted_sum/concatConcatV24linear/linear_model/auth_method/weighted_sum/Slice_14linear/linear_model/auth_method/weighted_sum/Slice_28linear/linear_model/auth_method/weighted_sum/concat/axis*
N*
T0*

Tidx0*
_output_shapes
:
ф
6linear/linear_model/auth_method/weighted_sum/Reshape_2Reshape,linear/linear_model/auth_method/weighted_sum3linear/linear_model/auth_method/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:         
Т
"linear/linear_model/country/lookupStringToHashBucketFastParseExample/ParseExample:8*
num_bucketsш*#
_output_shapes
:         
А
&linear/linear_model/country/Shape/CastCastParseExample/ParseExample:15*

SrcT0	*

DstT0*
_output_shapes
:
y
/linear/linear_model/country/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
{
1linear/linear_model/country/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
{
1linear/linear_model/country/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
К
)linear/linear_model/country/strided_sliceStridedSlice&linear/linear_model/country/Shape/Cast/linear/linear_model/country/strided_slice/stack1linear/linear_model/country/strided_slice/stack_11linear/linear_model/country/strided_slice/stack_2*
T0*
Index0*

begin_mask *
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
_output_shapes
: 
o
$linear/linear_model/country/Cast/x/1Const*
valueB :
         *
dtype0*
_output_shapes
: 
╡
"linear/linear_model/country/Cast/xPack)linear/linear_model/country/strided_slice$linear/linear_model/country/Cast/x/1*
N*
T0*

axis *
_output_shapes
:
А
 linear/linear_model/country/CastCast"linear/linear_model/country/Cast/x*

SrcT0*

DstT0	*
_output_shapes
:
╞
)linear/linear_model/country/SparseReshapeSparseReshapeParseExample/ParseExample:1ParseExample/ParseExample:15 linear/linear_model/country/Cast*-
_output_shapes
:         :
Р
2linear/linear_model/country/SparseReshape/IdentityIdentity"linear/linear_model/country/lookup*
T0	*#
_output_shapes
:         
╥
<linear/linear_model/country/weights/part_0/Initializer/zerosConst*
valueB	ш*    *
dtype0*=
_class3
1/loc:@linear/linear_model/country/weights/part_0*
_output_shapes
:	ш
▀
*linear/linear_model/country/weights/part_0
VariableV2*
shape:	ш*
dtype0*
	container *
shared_name *=
_class3
1/loc:@linear/linear_model/country/weights/part_0*
_output_shapes
:	ш
╖
1linear/linear_model/country/weights/part_0/AssignAssign*linear/linear_model/country/weights/part_0<linear/linear_model/country/weights/part_0/Initializer/zeros*
T0*
validate_shape(*
use_locking(*=
_class3
1/loc:@linear/linear_model/country/weights/part_0*
_output_shapes
:	ш
╨
/linear/linear_model/country/weights/part_0/readIdentity*linear/linear_model/country/weights/part_0*
T0*=
_class3
1/loc:@linear/linear_model/country/weights/part_0*
_output_shapes
:	ш
~
4linear/linear_model/country/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
}
3linear/linear_model/country/weighted_sum/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
Б
.linear/linear_model/country/weighted_sum/SliceSlice+linear/linear_model/country/SparseReshape:14linear/linear_model/country/weighted_sum/Slice/begin3linear/linear_model/country/weighted_sum/Slice/size*
T0	*
Index0*
_output_shapes
:
x
.linear/linear_model/country/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:
╙
-linear/linear_model/country/weighted_sum/ProdProd.linear/linear_model/country/weighted_sum/Slice.linear/linear_model/country/weighted_sum/Const*
	keep_dims( *
T0	*

Tidx0*
_output_shapes
: 
y
7linear/linear_model/country/weighted_sum/Gather/indicesConst*
value	B :*
dtype0*
_output_shapes
: 
ю
/linear/linear_model/country/weighted_sum/GatherGather+linear/linear_model/country/SparseReshape:17linear/linear_model/country/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
╤
/linear/linear_model/country/weighted_sum/Cast/xPack-linear/linear_model/country/weighted_sum/Prod/linear/linear_model/country/weighted_sum/Gather*
N*
T0	*

axis *
_output_shapes
:
 
6linear/linear_model/country/weighted_sum/SparseReshapeSparseReshape)linear/linear_model/country/SparseReshape+linear/linear_model/country/SparseReshape:1/linear/linear_model/country/weighted_sum/Cast/x*-
_output_shapes
:         :
н
?linear/linear_model/country/weighted_sum/SparseReshape/IdentityIdentity2linear/linear_model/country/SparseReshape/Identity*
T0	*#
_output_shapes
:         
y
7linear/linear_model/country/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
э
5linear/linear_model/country/weighted_sum/GreaterEqualGreaterEqual?linear/linear_model/country/weighted_sum/SparseReshape/Identity7linear/linear_model/country/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:         
Ч
.linear/linear_model/country/weighted_sum/WhereWhere5linear/linear_model/country/weighted_sum/GreaterEqual*'
_output_shapes
:         
Й
6linear/linear_model/country/weighted_sum/Reshape/shapeConst*
valueB:
         *
dtype0*
_output_shapes
:
▀
0linear/linear_model/country/weighted_sum/ReshapeReshape.linear/linear_model/country/weighted_sum/Where6linear/linear_model/country/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:         
Е
1linear/linear_model/country/weighted_sum/Gather_1Gather6linear/linear_model/country/weighted_sum/SparseReshape0linear/linear_model/country/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:         
К
1linear/linear_model/country/weighted_sum/Gather_2Gather?linear/linear_model/country/weighted_sum/SparseReshape/Identity0linear/linear_model/country/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:         
Ь
1linear/linear_model/country/weighted_sum/IdentityIdentity8linear/linear_model/country/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
Д
Blinear/linear_model/country/weighted_sum/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
г
Plinear/linear_model/country/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRows1linear/linear_model/country/weighted_sum/Gather_11linear/linear_model/country/weighted_sum/Gather_21linear/linear_model/country/weighted_sum/IdentityBlinear/linear_model/country/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:         :         :         :         
е
Tlinear/linear_model/country/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
з
Vlinear/linear_model/country/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
з
Vlinear/linear_model/country/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
╒
Nlinear/linear_model/country/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSlicePlinear/linear_model/country/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsTlinear/linear_model/country/weighted_sum/embedding_lookup_sparse/strided_slice/stackVlinear/linear_model/country/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Vlinear/linear_model/country/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
T0	*
Index0*

begin_mask*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*#
_output_shapes
:         
┌
Elinear/linear_model/country/weighted_sum/embedding_lookup_sparse/CastCastNlinear/linear_model/country/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*

DstT0*#
_output_shapes
:         
ё
Glinear/linear_model/country/weighted_sum/embedding_lookup_sparse/UniqueUniqueRlinear/linear_model/country/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*
out_idx0*2
_output_shapes 
:         :         
Ї
Qlinear/linear_model/country/weighted_sum/embedding_lookup_sparse/embedding_lookupGather/linear/linear_model/country/weights/part_0/readGlinear/linear_model/country/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*=
_class3
1/loc:@linear/linear_model/country/weights/part_0*'
_output_shapes
:         
ў
@linear/linear_model/country/weighted_sum/embedding_lookup_sparseSparseSegmentSumQlinear/linear_model/country/weighted_sum/embedding_lookup_sparse/embedding_lookupIlinear/linear_model/country/weighted_sum/embedding_lookup_sparse/Unique:1Elinear/linear_model/country/weighted_sum/embedding_lookup_sparse/Cast*
T0*

Tidx0*'
_output_shapes
:         
Й
8linear/linear_model/country/weighted_sum/Reshape_1/shapeConst*
valueB"       *
dtype0*
_output_shapes
:
Л
2linear/linear_model/country/weighted_sum/Reshape_1ReshapeRlinear/linear_model/country/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:28linear/linear_model/country/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:         
о
.linear/linear_model/country/weighted_sum/ShapeShape@linear/linear_model/country/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
Ж
<linear/linear_model/country/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
И
>linear/linear_model/country/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
И
>linear/linear_model/country/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
╞
6linear/linear_model/country/weighted_sum/strided_sliceStridedSlice.linear/linear_model/country/weighted_sum/Shape<linear/linear_model/country/weighted_sum/strided_slice/stack>linear/linear_model/country/weighted_sum/strided_slice/stack_1>linear/linear_model/country/weighted_sum/strided_slice/stack_2*
T0*
Index0*

begin_mask *
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
_output_shapes
: 
r
0linear/linear_model/country/weighted_sum/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
┌
.linear/linear_model/country/weighted_sum/stackPack0linear/linear_model/country/weighted_sum/stack/06linear/linear_model/country/weighted_sum/strided_slice*
N*
T0*

axis *
_output_shapes
:
ц
-linear/linear_model/country/weighted_sum/TileTile2linear/linear_model/country/weighted_sum/Reshape_1.linear/linear_model/country/weighted_sum/stack*
T0
*

Tmultiples0*0
_output_shapes
:                  
┤
3linear/linear_model/country/weighted_sum/zeros_like	ZerosLike@linear/linear_model/country/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:         
К
(linear/linear_model/country/weighted_sumSelect-linear/linear_model/country/weighted_sum/Tile3linear/linear_model/country/weighted_sum/zeros_like@linear/linear_model/country/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:         
Ш
/linear/linear_model/country/weighted_sum/Cast_1Cast+linear/linear_model/country/SparseReshape:1*

SrcT0	*

DstT0*
_output_shapes
:
А
6linear/linear_model/country/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:

5linear/linear_model/country/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
Л
0linear/linear_model/country/weighted_sum/Slice_1Slice/linear/linear_model/country/weighted_sum/Cast_16linear/linear_model/country/weighted_sum/Slice_1/begin5linear/linear_model/country/weighted_sum/Slice_1/size*
T0*
Index0*
_output_shapes
:
Ш
0linear/linear_model/country/weighted_sum/Shape_1Shape(linear/linear_model/country/weighted_sum*
T0*
out_type0*
_output_shapes
:
А
6linear/linear_model/country/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
И
5linear/linear_model/country/weighted_sum/Slice_2/sizeConst*
valueB:
         *
dtype0*
_output_shapes
:
М
0linear/linear_model/country/weighted_sum/Slice_2Slice0linear/linear_model/country/weighted_sum/Shape_16linear/linear_model/country/weighted_sum/Slice_2/begin5linear/linear_model/country/weighted_sum/Slice_2/size*
T0*
Index0*
_output_shapes
:
v
4linear/linear_model/country/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
П
/linear/linear_model/country/weighted_sum/concatConcatV20linear/linear_model/country/weighted_sum/Slice_10linear/linear_model/country/weighted_sum/Slice_24linear/linear_model/country/weighted_sum/concat/axis*
N*
T0*

Tidx0*
_output_shapes
:
╪
2linear/linear_model/country/weighted_sum/Reshape_2Reshape(linear/linear_model/country/weighted_sum/linear/linear_model/country/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:         
З
:linear/linear_model/invalid_user/invalid_user_lookup/ConstConst*
valueBB0B1*
dtype0*
_output_shapes
:
{
9linear/linear_model/invalid_user/invalid_user_lookup/SizeConst*
value	B :*
dtype0*
_output_shapes
: 
В
@linear/linear_model/invalid_user/invalid_user_lookup/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
В
@linear/linear_model/invalid_user/invalid_user_lookup/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
к
:linear/linear_model/invalid_user/invalid_user_lookup/rangeRange@linear/linear_model/invalid_user/invalid_user_lookup/range/start9linear/linear_model/invalid_user/invalid_user_lookup/Size@linear/linear_model/invalid_user/invalid_user_lookup/range/delta*

Tidx0*
_output_shapes
:
┤
<linear/linear_model/invalid_user/invalid_user_lookup/ToInt64Cast:linear/linear_model/invalid_user/invalid_user_lookup/range*

SrcT0*

DstT0	*
_output_shapes
:
╦
?linear/linear_model/invalid_user/invalid_user_lookup/hash_tableHashTableV2*
	container *
shared_name *
use_node_name_sharing( *
	key_dtype0*
value_dtype0	*
_output_shapes
: 
Р
Elinear/linear_model/invalid_user/invalid_user_lookup/hash_table/ConstConst*
valueB	 R
         *
dtype0	*
_output_shapes
: 
▓
Jlinear/linear_model/invalid_user/invalid_user_lookup/hash_table/table_initInitializeTableV2?linear/linear_model/invalid_user/invalid_user_lookup/hash_table:linear/linear_model/invalid_user/invalid_user_lookup/Const<linear/linear_model/invalid_user/invalid_user_lookup/ToInt64*

Tkey0*

Tval0	
и
2linear/linear_model/invalid_user/hash_table_LookupLookupTableFindV2?linear/linear_model/invalid_user/invalid_user_lookup/hash_tableParseExample/ParseExample:9Elinear/linear_model/invalid_user/invalid_user_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:         
Е
+linear/linear_model/invalid_user/Shape/CastCastParseExample/ParseExample:16*

SrcT0	*

DstT0*
_output_shapes
:
~
4linear/linear_model/invalid_user/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
А
6linear/linear_model/invalid_user/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
А
6linear/linear_model/invalid_user/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
г
.linear/linear_model/invalid_user/strided_sliceStridedSlice+linear/linear_model/invalid_user/Shape/Cast4linear/linear_model/invalid_user/strided_slice/stack6linear/linear_model/invalid_user/strided_slice/stack_16linear/linear_model/invalid_user/strided_slice/stack_2*
T0*
Index0*

begin_mask *
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
_output_shapes
: 
t
)linear/linear_model/invalid_user/Cast/x/1Const*
valueB :
         *
dtype0*
_output_shapes
: 
─
'linear/linear_model/invalid_user/Cast/xPack.linear/linear_model/invalid_user/strided_slice)linear/linear_model/invalid_user/Cast/x/1*
N*
T0*

axis *
_output_shapes
:
К
%linear/linear_model/invalid_user/CastCast'linear/linear_model/invalid_user/Cast/x*

SrcT0*

DstT0	*
_output_shapes
:
╨
.linear/linear_model/invalid_user/SparseReshapeSparseReshapeParseExample/ParseExample:2ParseExample/ParseExample:16%linear/linear_model/invalid_user/Cast*-
_output_shapes
:         :
е
7linear/linear_model/invalid_user/SparseReshape/IdentityIdentity2linear/linear_model/invalid_user/hash_table_Lookup*
T0	*#
_output_shapes
:         
┌
Alinear/linear_model/invalid_user/weights/part_0/Initializer/zerosConst*
valueB*    *
dtype0*B
_class8
64loc:@linear/linear_model/invalid_user/weights/part_0*
_output_shapes

:
ч
/linear/linear_model/invalid_user/weights/part_0
VariableV2*
shape
:*
dtype0*
	container *
shared_name *B
_class8
64loc:@linear/linear_model/invalid_user/weights/part_0*
_output_shapes

:
╩
6linear/linear_model/invalid_user/weights/part_0/AssignAssign/linear/linear_model/invalid_user/weights/part_0Alinear/linear_model/invalid_user/weights/part_0/Initializer/zeros*
T0*
validate_shape(*
use_locking(*B
_class8
64loc:@linear/linear_model/invalid_user/weights/part_0*
_output_shapes

:
▐
4linear/linear_model/invalid_user/weights/part_0/readIdentity/linear/linear_model/invalid_user/weights/part_0*
T0*B
_class8
64loc:@linear/linear_model/invalid_user/weights/part_0*
_output_shapes

:
Г
9linear/linear_model/invalid_user/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
В
8linear/linear_model/invalid_user/weighted_sum/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
Х
3linear/linear_model/invalid_user/weighted_sum/SliceSlice0linear/linear_model/invalid_user/SparseReshape:19linear/linear_model/invalid_user/weighted_sum/Slice/begin8linear/linear_model/invalid_user/weighted_sum/Slice/size*
T0	*
Index0*
_output_shapes
:
}
3linear/linear_model/invalid_user/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:
т
2linear/linear_model/invalid_user/weighted_sum/ProdProd3linear/linear_model/invalid_user/weighted_sum/Slice3linear/linear_model/invalid_user/weighted_sum/Const*
	keep_dims( *
T0	*

Tidx0*
_output_shapes
: 
~
<linear/linear_model/invalid_user/weighted_sum/Gather/indicesConst*
value	B :*
dtype0*
_output_shapes
: 
¤
4linear/linear_model/invalid_user/weighted_sum/GatherGather0linear/linear_model/invalid_user/SparseReshape:1<linear/linear_model/invalid_user/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
р
4linear/linear_model/invalid_user/weighted_sum/Cast/xPack2linear/linear_model/invalid_user/weighted_sum/Prod4linear/linear_model/invalid_user/weighted_sum/Gather*
N*
T0	*

axis *
_output_shapes
:
У
;linear/linear_model/invalid_user/weighted_sum/SparseReshapeSparseReshape.linear/linear_model/invalid_user/SparseReshape0linear/linear_model/invalid_user/SparseReshape:14linear/linear_model/invalid_user/weighted_sum/Cast/x*-
_output_shapes
:         :
╖
Dlinear/linear_model/invalid_user/weighted_sum/SparseReshape/IdentityIdentity7linear/linear_model/invalid_user/SparseReshape/Identity*
T0	*#
_output_shapes
:         
~
<linear/linear_model/invalid_user/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
№
:linear/linear_model/invalid_user/weighted_sum/GreaterEqualGreaterEqualDlinear/linear_model/invalid_user/weighted_sum/SparseReshape/Identity<linear/linear_model/invalid_user/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:         
б
3linear/linear_model/invalid_user/weighted_sum/WhereWhere:linear/linear_model/invalid_user/weighted_sum/GreaterEqual*'
_output_shapes
:         
О
;linear/linear_model/invalid_user/weighted_sum/Reshape/shapeConst*
valueB:
         *
dtype0*
_output_shapes
:
ю
5linear/linear_model/invalid_user/weighted_sum/ReshapeReshape3linear/linear_model/invalid_user/weighted_sum/Where;linear/linear_model/invalid_user/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:         
Ф
6linear/linear_model/invalid_user/weighted_sum/Gather_1Gather;linear/linear_model/invalid_user/weighted_sum/SparseReshape5linear/linear_model/invalid_user/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:         
Щ
6linear/linear_model/invalid_user/weighted_sum/Gather_2GatherDlinear/linear_model/invalid_user/weighted_sum/SparseReshape/Identity5linear/linear_model/invalid_user/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:         
ж
6linear/linear_model/invalid_user/weighted_sum/IdentityIdentity=linear/linear_model/invalid_user/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
Й
Glinear/linear_model/invalid_user/weighted_sum/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
╝
Ulinear/linear_model/invalid_user/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRows6linear/linear_model/invalid_user/weighted_sum/Gather_16linear/linear_model/invalid_user/weighted_sum/Gather_26linear/linear_model/invalid_user/weighted_sum/IdentityGlinear/linear_model/invalid_user/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:         :         :         :         
к
Ylinear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
м
[linear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
м
[linear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
ю
Slinear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceUlinear/linear_model/invalid_user/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsYlinear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse/strided_slice/stack[linear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1[linear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
T0	*
Index0*

begin_mask*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*#
_output_shapes
:         
ф
Jlinear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse/CastCastSlinear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*

DstT0*#
_output_shapes
:         
√
Llinear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse/UniqueUniqueWlinear/linear_model/invalid_user/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*
out_idx0*2
_output_shapes 
:         :         
И
Vlinear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse/embedding_lookupGather4linear/linear_model/invalid_user/weights/part_0/readLlinear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*B
_class8
64loc:@linear/linear_model/invalid_user/weights/part_0*'
_output_shapes
:         
Л
Elinear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparseSparseSegmentSumVlinear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse/embedding_lookupNlinear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse/Unique:1Jlinear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse/Cast*
T0*

Tidx0*'
_output_shapes
:         
О
=linear/linear_model/invalid_user/weighted_sum/Reshape_1/shapeConst*
valueB"       *
dtype0*
_output_shapes
:
Ъ
7linear/linear_model/invalid_user/weighted_sum/Reshape_1ReshapeWlinear/linear_model/invalid_user/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:2=linear/linear_model/invalid_user/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:         
╕
3linear/linear_model/invalid_user/weighted_sum/ShapeShapeElinear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
Л
Alinear/linear_model/invalid_user/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
Н
Clinear/linear_model/invalid_user/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Н
Clinear/linear_model/invalid_user/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
▀
;linear/linear_model/invalid_user/weighted_sum/strided_sliceStridedSlice3linear/linear_model/invalid_user/weighted_sum/ShapeAlinear/linear_model/invalid_user/weighted_sum/strided_slice/stackClinear/linear_model/invalid_user/weighted_sum/strided_slice/stack_1Clinear/linear_model/invalid_user/weighted_sum/strided_slice/stack_2*
T0*
Index0*

begin_mask *
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
_output_shapes
: 
w
5linear/linear_model/invalid_user/weighted_sum/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
щ
3linear/linear_model/invalid_user/weighted_sum/stackPack5linear/linear_model/invalid_user/weighted_sum/stack/0;linear/linear_model/invalid_user/weighted_sum/strided_slice*
N*
T0*

axis *
_output_shapes
:
ї
2linear/linear_model/invalid_user/weighted_sum/TileTile7linear/linear_model/invalid_user/weighted_sum/Reshape_13linear/linear_model/invalid_user/weighted_sum/stack*
T0
*

Tmultiples0*0
_output_shapes
:                  
╛
8linear/linear_model/invalid_user/weighted_sum/zeros_like	ZerosLikeElinear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:         
Ю
-linear/linear_model/invalid_user/weighted_sumSelect2linear/linear_model/invalid_user/weighted_sum/Tile8linear/linear_model/invalid_user/weighted_sum/zeros_likeElinear/linear_model/invalid_user/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:         
в
4linear/linear_model/invalid_user/weighted_sum/Cast_1Cast0linear/linear_model/invalid_user/SparseReshape:1*

SrcT0	*

DstT0*
_output_shapes
:
Е
;linear/linear_model/invalid_user/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:
Д
:linear/linear_model/invalid_user/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
Я
5linear/linear_model/invalid_user/weighted_sum/Slice_1Slice4linear/linear_model/invalid_user/weighted_sum/Cast_1;linear/linear_model/invalid_user/weighted_sum/Slice_1/begin:linear/linear_model/invalid_user/weighted_sum/Slice_1/size*
T0*
Index0*
_output_shapes
:
в
5linear/linear_model/invalid_user/weighted_sum/Shape_1Shape-linear/linear_model/invalid_user/weighted_sum*
T0*
out_type0*
_output_shapes
:
Е
;linear/linear_model/invalid_user/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
Н
:linear/linear_model/invalid_user/weighted_sum/Slice_2/sizeConst*
valueB:
         *
dtype0*
_output_shapes
:
а
5linear/linear_model/invalid_user/weighted_sum/Slice_2Slice5linear/linear_model/invalid_user/weighted_sum/Shape_1;linear/linear_model/invalid_user/weighted_sum/Slice_2/begin:linear/linear_model/invalid_user/weighted_sum/Slice_2/size*
T0*
Index0*
_output_shapes
:
{
9linear/linear_model/invalid_user/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
г
4linear/linear_model/invalid_user/weighted_sum/concatConcatV25linear/linear_model/invalid_user/weighted_sum/Slice_15linear/linear_model/invalid_user/weighted_sum/Slice_29linear/linear_model/invalid_user/weighted_sum/concat/axis*
N*
T0*

Tidx0*
_output_shapes
:
ч
7linear/linear_model/invalid_user/weighted_sum/Reshape_2Reshape-linear/linear_model/invalid_user/weighted_sum4linear/linear_model/invalid_user/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:         
О
linear/linear_model/ip/lookupStringToHashBucketFastParseExample/ParseExample:10*
num_bucketsИ'*#
_output_shapes
:         
{
!linear/linear_model/ip/Shape/CastCastParseExample/ParseExample:17*

SrcT0	*

DstT0*
_output_shapes
:
t
*linear/linear_model/ip/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
v
,linear/linear_model/ip/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
v
,linear/linear_model/ip/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
ё
$linear/linear_model/ip/strided_sliceStridedSlice!linear/linear_model/ip/Shape/Cast*linear/linear_model/ip/strided_slice/stack,linear/linear_model/ip/strided_slice/stack_1,linear/linear_model/ip/strided_slice/stack_2*
T0*
Index0*

begin_mask *
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
_output_shapes
: 
j
linear/linear_model/ip/Cast/x/1Const*
valueB :
         *
dtype0*
_output_shapes
: 
ж
linear/linear_model/ip/Cast/xPack$linear/linear_model/ip/strided_slicelinear/linear_model/ip/Cast/x/1*
N*
T0*

axis *
_output_shapes
:
v
linear/linear_model/ip/CastCastlinear/linear_model/ip/Cast/x*

SrcT0*

DstT0	*
_output_shapes
:
╝
$linear/linear_model/ip/SparseReshapeSparseReshapeParseExample/ParseExample:3ParseExample/ParseExample:17linear/linear_model/ip/Cast*-
_output_shapes
:         :
Ж
-linear/linear_model/ip/SparseReshape/IdentityIdentitylinear/linear_model/ip/lookup*
T0	*#
_output_shapes
:         
╚
7linear/linear_model/ip/weights/part_0/Initializer/zerosConst*
valueB	И'*    *
dtype0*8
_class.
,*loc:@linear/linear_model/ip/weights/part_0*
_output_shapes
:	И'
╒
%linear/linear_model/ip/weights/part_0
VariableV2*
shape:	И'*
dtype0*
	container *
shared_name *8
_class.
,*loc:@linear/linear_model/ip/weights/part_0*
_output_shapes
:	И'
г
,linear/linear_model/ip/weights/part_0/AssignAssign%linear/linear_model/ip/weights/part_07linear/linear_model/ip/weights/part_0/Initializer/zeros*
T0*
validate_shape(*
use_locking(*8
_class.
,*loc:@linear/linear_model/ip/weights/part_0*
_output_shapes
:	И'
┴
*linear/linear_model/ip/weights/part_0/readIdentity%linear/linear_model/ip/weights/part_0*
T0*8
_class.
,*loc:@linear/linear_model/ip/weights/part_0*
_output_shapes
:	И'
y
/linear/linear_model/ip/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
x
.linear/linear_model/ip/weighted_sum/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
э
)linear/linear_model/ip/weighted_sum/SliceSlice&linear/linear_model/ip/SparseReshape:1/linear/linear_model/ip/weighted_sum/Slice/begin.linear/linear_model/ip/weighted_sum/Slice/size*
T0	*
Index0*
_output_shapes
:
s
)linear/linear_model/ip/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:
─
(linear/linear_model/ip/weighted_sum/ProdProd)linear/linear_model/ip/weighted_sum/Slice)linear/linear_model/ip/weighted_sum/Const*
	keep_dims( *
T0	*

Tidx0*
_output_shapes
: 
t
2linear/linear_model/ip/weighted_sum/Gather/indicesConst*
value	B :*
dtype0*
_output_shapes
: 
▀
*linear/linear_model/ip/weighted_sum/GatherGather&linear/linear_model/ip/SparseReshape:12linear/linear_model/ip/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
┬
*linear/linear_model/ip/weighted_sum/Cast/xPack(linear/linear_model/ip/weighted_sum/Prod*linear/linear_model/ip/weighted_sum/Gather*
N*
T0	*

axis *
_output_shapes
:
ы
1linear/linear_model/ip/weighted_sum/SparseReshapeSparseReshape$linear/linear_model/ip/SparseReshape&linear/linear_model/ip/SparseReshape:1*linear/linear_model/ip/weighted_sum/Cast/x*-
_output_shapes
:         :
г
:linear/linear_model/ip/weighted_sum/SparseReshape/IdentityIdentity-linear/linear_model/ip/SparseReshape/Identity*
T0	*#
_output_shapes
:         
t
2linear/linear_model/ip/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
▐
0linear/linear_model/ip/weighted_sum/GreaterEqualGreaterEqual:linear/linear_model/ip/weighted_sum/SparseReshape/Identity2linear/linear_model/ip/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:         
Н
)linear/linear_model/ip/weighted_sum/WhereWhere0linear/linear_model/ip/weighted_sum/GreaterEqual*'
_output_shapes
:         
Д
1linear/linear_model/ip/weighted_sum/Reshape/shapeConst*
valueB:
         *
dtype0*
_output_shapes
:
╨
+linear/linear_model/ip/weighted_sum/ReshapeReshape)linear/linear_model/ip/weighted_sum/Where1linear/linear_model/ip/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:         
Ў
,linear/linear_model/ip/weighted_sum/Gather_1Gather1linear/linear_model/ip/weighted_sum/SparseReshape+linear/linear_model/ip/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:         
√
,linear/linear_model/ip/weighted_sum/Gather_2Gather:linear/linear_model/ip/weighted_sum/SparseReshape/Identity+linear/linear_model/ip/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:         
Т
,linear/linear_model/ip/weighted_sum/IdentityIdentity3linear/linear_model/ip/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:

=linear/linear_model/ip/weighted_sum/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
К
Klinear/linear_model/ip/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRows,linear/linear_model/ip/weighted_sum/Gather_1,linear/linear_model/ip/weighted_sum/Gather_2,linear/linear_model/ip/weighted_sum/Identity=linear/linear_model/ip/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:         :         :         :         
а
Olinear/linear_model/ip/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
в
Qlinear/linear_model/ip/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
в
Qlinear/linear_model/ip/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
╝
Ilinear/linear_model/ip/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceKlinear/linear_model/ip/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsOlinear/linear_model/ip/weighted_sum/embedding_lookup_sparse/strided_slice/stackQlinear/linear_model/ip/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Qlinear/linear_model/ip/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
T0	*
Index0*

begin_mask*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*#
_output_shapes
:         
╨
@linear/linear_model/ip/weighted_sum/embedding_lookup_sparse/CastCastIlinear/linear_model/ip/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*

DstT0*#
_output_shapes
:         
ч
Blinear/linear_model/ip/weighted_sum/embedding_lookup_sparse/UniqueUniqueMlinear/linear_model/ip/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*
out_idx0*2
_output_shapes 
:         :         
р
Llinear/linear_model/ip/weighted_sum/embedding_lookup_sparse/embedding_lookupGather*linear/linear_model/ip/weights/part_0/readBlinear/linear_model/ip/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*8
_class.
,*loc:@linear/linear_model/ip/weights/part_0*'
_output_shapes
:         
у
;linear/linear_model/ip/weighted_sum/embedding_lookup_sparseSparseSegmentSumLlinear/linear_model/ip/weighted_sum/embedding_lookup_sparse/embedding_lookupDlinear/linear_model/ip/weighted_sum/embedding_lookup_sparse/Unique:1@linear/linear_model/ip/weighted_sum/embedding_lookup_sparse/Cast*
T0*

Tidx0*'
_output_shapes
:         
Д
3linear/linear_model/ip/weighted_sum/Reshape_1/shapeConst*
valueB"       *
dtype0*
_output_shapes
:
№
-linear/linear_model/ip/weighted_sum/Reshape_1ReshapeMlinear/linear_model/ip/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:23linear/linear_model/ip/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:         
д
)linear/linear_model/ip/weighted_sum/ShapeShape;linear/linear_model/ip/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
Б
7linear/linear_model/ip/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
Г
9linear/linear_model/ip/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Г
9linear/linear_model/ip/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
н
1linear/linear_model/ip/weighted_sum/strided_sliceStridedSlice)linear/linear_model/ip/weighted_sum/Shape7linear/linear_model/ip/weighted_sum/strided_slice/stack9linear/linear_model/ip/weighted_sum/strided_slice/stack_19linear/linear_model/ip/weighted_sum/strided_slice/stack_2*
T0*
Index0*

begin_mask *
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
_output_shapes
: 
m
+linear/linear_model/ip/weighted_sum/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
╦
)linear/linear_model/ip/weighted_sum/stackPack+linear/linear_model/ip/weighted_sum/stack/01linear/linear_model/ip/weighted_sum/strided_slice*
N*
T0*

axis *
_output_shapes
:
╫
(linear/linear_model/ip/weighted_sum/TileTile-linear/linear_model/ip/weighted_sum/Reshape_1)linear/linear_model/ip/weighted_sum/stack*
T0
*

Tmultiples0*0
_output_shapes
:                  
к
.linear/linear_model/ip/weighted_sum/zeros_like	ZerosLike;linear/linear_model/ip/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:         
Ў
#linear/linear_model/ip/weighted_sumSelect(linear/linear_model/ip/weighted_sum/Tile.linear/linear_model/ip/weighted_sum/zeros_like;linear/linear_model/ip/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:         
О
*linear/linear_model/ip/weighted_sum/Cast_1Cast&linear/linear_model/ip/SparseReshape:1*

SrcT0	*

DstT0*
_output_shapes
:
{
1linear/linear_model/ip/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:
z
0linear/linear_model/ip/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
ў
+linear/linear_model/ip/weighted_sum/Slice_1Slice*linear/linear_model/ip/weighted_sum/Cast_11linear/linear_model/ip/weighted_sum/Slice_1/begin0linear/linear_model/ip/weighted_sum/Slice_1/size*
T0*
Index0*
_output_shapes
:
О
+linear/linear_model/ip/weighted_sum/Shape_1Shape#linear/linear_model/ip/weighted_sum*
T0*
out_type0*
_output_shapes
:
{
1linear/linear_model/ip/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
Г
0linear/linear_model/ip/weighted_sum/Slice_2/sizeConst*
valueB:
         *
dtype0*
_output_shapes
:
°
+linear/linear_model/ip/weighted_sum/Slice_2Slice+linear/linear_model/ip/weighted_sum/Shape_11linear/linear_model/ip/weighted_sum/Slice_2/begin0linear/linear_model/ip/weighted_sum/Slice_2/size*
T0*
Index0*
_output_shapes
:
q
/linear/linear_model/ip/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
√
*linear/linear_model/ip/weighted_sum/concatConcatV2+linear/linear_model/ip/weighted_sum/Slice_1+linear/linear_model/ip/weighted_sum/Slice_2/linear/linear_model/ip/weighted_sum/concat/axis*
N*
T0*

Tidx0*
_output_shapes
:
╔
-linear/linear_model/ip/weighted_sum/Reshape_2Reshape#linear/linear_model/ip/weighted_sum*linear/linear_model/ip/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:         
Ф
#linear/linear_model/provider/lookupStringToHashBucketFastParseExample/ParseExample:11*
num_bucketsш*#
_output_shapes
:         
Б
'linear/linear_model/provider/Shape/CastCastParseExample/ParseExample:18*

SrcT0	*

DstT0*
_output_shapes
:
z
0linear/linear_model/provider/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
|
2linear/linear_model/provider/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
|
2linear/linear_model/provider/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
П
*linear/linear_model/provider/strided_sliceStridedSlice'linear/linear_model/provider/Shape/Cast0linear/linear_model/provider/strided_slice/stack2linear/linear_model/provider/strided_slice/stack_12linear/linear_model/provider/strided_slice/stack_2*
T0*
Index0*

begin_mask *
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
_output_shapes
: 
p
%linear/linear_model/provider/Cast/x/1Const*
valueB :
         *
dtype0*
_output_shapes
: 
╕
#linear/linear_model/provider/Cast/xPack*linear/linear_model/provider/strided_slice%linear/linear_model/provider/Cast/x/1*
N*
T0*

axis *
_output_shapes
:
В
!linear/linear_model/provider/CastCast#linear/linear_model/provider/Cast/x*

SrcT0*

DstT0	*
_output_shapes
:
╚
*linear/linear_model/provider/SparseReshapeSparseReshapeParseExample/ParseExample:4ParseExample/ParseExample:18!linear/linear_model/provider/Cast*-
_output_shapes
:         :
Т
3linear/linear_model/provider/SparseReshape/IdentityIdentity#linear/linear_model/provider/lookup*
T0	*#
_output_shapes
:         
╘
=linear/linear_model/provider/weights/part_0/Initializer/zerosConst*
valueB	ш*    *
dtype0*>
_class4
20loc:@linear/linear_model/provider/weights/part_0*
_output_shapes
:	ш
с
+linear/linear_model/provider/weights/part_0
VariableV2*
shape:	ш*
dtype0*
	container *
shared_name *>
_class4
20loc:@linear/linear_model/provider/weights/part_0*
_output_shapes
:	ш
╗
2linear/linear_model/provider/weights/part_0/AssignAssign+linear/linear_model/provider/weights/part_0=linear/linear_model/provider/weights/part_0/Initializer/zeros*
T0*
validate_shape(*
use_locking(*>
_class4
20loc:@linear/linear_model/provider/weights/part_0*
_output_shapes
:	ш
╙
0linear/linear_model/provider/weights/part_0/readIdentity+linear/linear_model/provider/weights/part_0*
T0*>
_class4
20loc:@linear/linear_model/provider/weights/part_0*
_output_shapes
:	ш

5linear/linear_model/provider/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
~
4linear/linear_model/provider/weighted_sum/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
Е
/linear/linear_model/provider/weighted_sum/SliceSlice,linear/linear_model/provider/SparseReshape:15linear/linear_model/provider/weighted_sum/Slice/begin4linear/linear_model/provider/weighted_sum/Slice/size*
T0	*
Index0*
_output_shapes
:
y
/linear/linear_model/provider/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:
╓
.linear/linear_model/provider/weighted_sum/ProdProd/linear/linear_model/provider/weighted_sum/Slice/linear/linear_model/provider/weighted_sum/Const*
	keep_dims( *
T0	*

Tidx0*
_output_shapes
: 
z
8linear/linear_model/provider/weighted_sum/Gather/indicesConst*
value	B :*
dtype0*
_output_shapes
: 
ё
0linear/linear_model/provider/weighted_sum/GatherGather,linear/linear_model/provider/SparseReshape:18linear/linear_model/provider/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
╘
0linear/linear_model/provider/weighted_sum/Cast/xPack.linear/linear_model/provider/weighted_sum/Prod0linear/linear_model/provider/weighted_sum/Gather*
N*
T0	*

axis *
_output_shapes
:
Г
7linear/linear_model/provider/weighted_sum/SparseReshapeSparseReshape*linear/linear_model/provider/SparseReshape,linear/linear_model/provider/SparseReshape:10linear/linear_model/provider/weighted_sum/Cast/x*-
_output_shapes
:         :
п
@linear/linear_model/provider/weighted_sum/SparseReshape/IdentityIdentity3linear/linear_model/provider/SparseReshape/Identity*
T0	*#
_output_shapes
:         
z
8linear/linear_model/provider/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
Ё
6linear/linear_model/provider/weighted_sum/GreaterEqualGreaterEqual@linear/linear_model/provider/weighted_sum/SparseReshape/Identity8linear/linear_model/provider/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:         
Щ
/linear/linear_model/provider/weighted_sum/WhereWhere6linear/linear_model/provider/weighted_sum/GreaterEqual*'
_output_shapes
:         
К
7linear/linear_model/provider/weighted_sum/Reshape/shapeConst*
valueB:
         *
dtype0*
_output_shapes
:
т
1linear/linear_model/provider/weighted_sum/ReshapeReshape/linear/linear_model/provider/weighted_sum/Where7linear/linear_model/provider/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:         
И
2linear/linear_model/provider/weighted_sum/Gather_1Gather7linear/linear_model/provider/weighted_sum/SparseReshape1linear/linear_model/provider/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:         
Н
2linear/linear_model/provider/weighted_sum/Gather_2Gather@linear/linear_model/provider/weighted_sum/SparseReshape/Identity1linear/linear_model/provider/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:         
Ю
2linear/linear_model/provider/weighted_sum/IdentityIdentity9linear/linear_model/provider/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
Е
Clinear/linear_model/provider/weighted_sum/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
и
Qlinear/linear_model/provider/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRows2linear/linear_model/provider/weighted_sum/Gather_12linear/linear_model/provider/weighted_sum/Gather_22linear/linear_model/provider/weighted_sum/IdentityClinear/linear_model/provider/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:         :         :         :         
ж
Ulinear/linear_model/provider/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
и
Wlinear/linear_model/provider/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
и
Wlinear/linear_model/provider/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
┌
Olinear/linear_model/provider/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceQlinear/linear_model/provider/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsUlinear/linear_model/provider/weighted_sum/embedding_lookup_sparse/strided_slice/stackWlinear/linear_model/provider/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Wlinear/linear_model/provider/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
T0	*
Index0*

begin_mask*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*#
_output_shapes
:         
▄
Flinear/linear_model/provider/weighted_sum/embedding_lookup_sparse/CastCastOlinear/linear_model/provider/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*

DstT0*#
_output_shapes
:         
є
Hlinear/linear_model/provider/weighted_sum/embedding_lookup_sparse/UniqueUniqueSlinear/linear_model/provider/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*
out_idx0*2
_output_shapes 
:         :         
°
Rlinear/linear_model/provider/weighted_sum/embedding_lookup_sparse/embedding_lookupGather0linear/linear_model/provider/weights/part_0/readHlinear/linear_model/provider/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*>
_class4
20loc:@linear/linear_model/provider/weights/part_0*'
_output_shapes
:         
√
Alinear/linear_model/provider/weighted_sum/embedding_lookup_sparseSparseSegmentSumRlinear/linear_model/provider/weighted_sum/embedding_lookup_sparse/embedding_lookupJlinear/linear_model/provider/weighted_sum/embedding_lookup_sparse/Unique:1Flinear/linear_model/provider/weighted_sum/embedding_lookup_sparse/Cast*
T0*

Tidx0*'
_output_shapes
:         
К
9linear/linear_model/provider/weighted_sum/Reshape_1/shapeConst*
valueB"       *
dtype0*
_output_shapes
:
О
3linear/linear_model/provider/weighted_sum/Reshape_1ReshapeSlinear/linear_model/provider/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:29linear/linear_model/provider/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:         
░
/linear/linear_model/provider/weighted_sum/ShapeShapeAlinear/linear_model/provider/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
З
=linear/linear_model/provider/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
Й
?linear/linear_model/provider/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Й
?linear/linear_model/provider/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
╦
7linear/linear_model/provider/weighted_sum/strided_sliceStridedSlice/linear/linear_model/provider/weighted_sum/Shape=linear/linear_model/provider/weighted_sum/strided_slice/stack?linear/linear_model/provider/weighted_sum/strided_slice/stack_1?linear/linear_model/provider/weighted_sum/strided_slice/stack_2*
T0*
Index0*

begin_mask *
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
_output_shapes
: 
s
1linear/linear_model/provider/weighted_sum/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
▌
/linear/linear_model/provider/weighted_sum/stackPack1linear/linear_model/provider/weighted_sum/stack/07linear/linear_model/provider/weighted_sum/strided_slice*
N*
T0*

axis *
_output_shapes
:
щ
.linear/linear_model/provider/weighted_sum/TileTile3linear/linear_model/provider/weighted_sum/Reshape_1/linear/linear_model/provider/weighted_sum/stack*
T0
*

Tmultiples0*0
_output_shapes
:                  
╢
4linear/linear_model/provider/weighted_sum/zeros_like	ZerosLikeAlinear/linear_model/provider/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:         
О
)linear/linear_model/provider/weighted_sumSelect.linear/linear_model/provider/weighted_sum/Tile4linear/linear_model/provider/weighted_sum/zeros_likeAlinear/linear_model/provider/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:         
Ъ
0linear/linear_model/provider/weighted_sum/Cast_1Cast,linear/linear_model/provider/SparseReshape:1*

SrcT0	*

DstT0*
_output_shapes
:
Б
7linear/linear_model/provider/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:
А
6linear/linear_model/provider/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
П
1linear/linear_model/provider/weighted_sum/Slice_1Slice0linear/linear_model/provider/weighted_sum/Cast_17linear/linear_model/provider/weighted_sum/Slice_1/begin6linear/linear_model/provider/weighted_sum/Slice_1/size*
T0*
Index0*
_output_shapes
:
Ъ
1linear/linear_model/provider/weighted_sum/Shape_1Shape)linear/linear_model/provider/weighted_sum*
T0*
out_type0*
_output_shapes
:
Б
7linear/linear_model/provider/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
Й
6linear/linear_model/provider/weighted_sum/Slice_2/sizeConst*
valueB:
         *
dtype0*
_output_shapes
:
Р
1linear/linear_model/provider/weighted_sum/Slice_2Slice1linear/linear_model/provider/weighted_sum/Shape_17linear/linear_model/provider/weighted_sum/Slice_2/begin6linear/linear_model/provider/weighted_sum/Slice_2/size*
T0*
Index0*
_output_shapes
:
w
5linear/linear_model/provider/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
У
0linear/linear_model/provider/weighted_sum/concatConcatV21linear/linear_model/provider/weighted_sum/Slice_11linear/linear_model/provider/weighted_sum/Slice_25linear/linear_model/provider/weighted_sum/concat/axis*
N*
T0*

Tidx0*
_output_shapes
:
█
3linear/linear_model/provider/weighted_sum/Reshape_2Reshape)linear/linear_model/provider/weighted_sum0linear/linear_model/provider/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:         
Й
0linear/linear_model/success/success_lookup/ConstConst*%
valueBBAcceptedBFailed*
dtype0*
_output_shapes
:
q
/linear/linear_model/success/success_lookup/SizeConst*
value	B :*
dtype0*
_output_shapes
: 
x
6linear/linear_model/success/success_lookup/range/startConst*
value	B : *
dtype0*
_output_shapes
: 
x
6linear/linear_model/success/success_lookup/range/deltaConst*
value	B :*
dtype0*
_output_shapes
: 
В
0linear/linear_model/success/success_lookup/rangeRange6linear/linear_model/success/success_lookup/range/start/linear/linear_model/success/success_lookup/Size6linear/linear_model/success/success_lookup/range/delta*

Tidx0*
_output_shapes
:
а
2linear/linear_model/success/success_lookup/ToInt64Cast0linear/linear_model/success/success_lookup/range*

SrcT0*

DstT0	*
_output_shapes
:
┴
5linear/linear_model/success/success_lookup/hash_tableHashTableV2*
	container *
shared_name *
use_node_name_sharing( *
	key_dtype0*
value_dtype0	*
_output_shapes
: 
Ж
;linear/linear_model/success/success_lookup/hash_table/ConstConst*
valueB	 R
         *
dtype0	*
_output_shapes
: 
К
@linear/linear_model/success/success_lookup/hash_table/table_initInitializeTableV25linear/linear_model/success/success_lookup/hash_table0linear/linear_model/success/success_lookup/Const2linear/linear_model/success/success_lookup/ToInt64*

Tkey0*

Tval0	
Р
-linear/linear_model/success/hash_table_LookupLookupTableFindV25linear/linear_model/success/success_lookup/hash_tableParseExample/ParseExample:12;linear/linear_model/success/success_lookup/hash_table/Const*	
Tin0*

Tout0	*#
_output_shapes
:         
А
&linear/linear_model/success/Shape/CastCastParseExample/ParseExample:19*

SrcT0	*

DstT0*
_output_shapes
:
y
/linear/linear_model/success/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
{
1linear/linear_model/success/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
{
1linear/linear_model/success/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
К
)linear/linear_model/success/strided_sliceStridedSlice&linear/linear_model/success/Shape/Cast/linear/linear_model/success/strided_slice/stack1linear/linear_model/success/strided_slice/stack_11linear/linear_model/success/strided_slice/stack_2*
T0*
Index0*

begin_mask *
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
_output_shapes
: 
o
$linear/linear_model/success/Cast/x/1Const*
valueB :
         *
dtype0*
_output_shapes
: 
╡
"linear/linear_model/success/Cast/xPack)linear/linear_model/success/strided_slice$linear/linear_model/success/Cast/x/1*
N*
T0*

axis *
_output_shapes
:
А
 linear/linear_model/success/CastCast"linear/linear_model/success/Cast/x*

SrcT0*

DstT0	*
_output_shapes
:
╞
)linear/linear_model/success/SparseReshapeSparseReshapeParseExample/ParseExample:5ParseExample/ParseExample:19 linear/linear_model/success/Cast*-
_output_shapes
:         :
Ы
2linear/linear_model/success/SparseReshape/IdentityIdentity-linear/linear_model/success/hash_table_Lookup*
T0	*#
_output_shapes
:         
╨
<linear/linear_model/success/weights/part_0/Initializer/zerosConst*
valueB*    *
dtype0*=
_class3
1/loc:@linear/linear_model/success/weights/part_0*
_output_shapes

:
▌
*linear/linear_model/success/weights/part_0
VariableV2*
shape
:*
dtype0*
	container *
shared_name *=
_class3
1/loc:@linear/linear_model/success/weights/part_0*
_output_shapes

:
╢
1linear/linear_model/success/weights/part_0/AssignAssign*linear/linear_model/success/weights/part_0<linear/linear_model/success/weights/part_0/Initializer/zeros*
T0*
validate_shape(*
use_locking(*=
_class3
1/loc:@linear/linear_model/success/weights/part_0*
_output_shapes

:
╧
/linear/linear_model/success/weights/part_0/readIdentity*linear/linear_model/success/weights/part_0*
T0*=
_class3
1/loc:@linear/linear_model/success/weights/part_0*
_output_shapes

:
~
4linear/linear_model/success/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
}
3linear/linear_model/success/weighted_sum/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
Б
.linear/linear_model/success/weighted_sum/SliceSlice+linear/linear_model/success/SparseReshape:14linear/linear_model/success/weighted_sum/Slice/begin3linear/linear_model/success/weighted_sum/Slice/size*
T0	*
Index0*
_output_shapes
:
x
.linear/linear_model/success/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:
╙
-linear/linear_model/success/weighted_sum/ProdProd.linear/linear_model/success/weighted_sum/Slice.linear/linear_model/success/weighted_sum/Const*
	keep_dims( *
T0	*

Tidx0*
_output_shapes
: 
y
7linear/linear_model/success/weighted_sum/Gather/indicesConst*
value	B :*
dtype0*
_output_shapes
: 
ю
/linear/linear_model/success/weighted_sum/GatherGather+linear/linear_model/success/SparseReshape:17linear/linear_model/success/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
╤
/linear/linear_model/success/weighted_sum/Cast/xPack-linear/linear_model/success/weighted_sum/Prod/linear/linear_model/success/weighted_sum/Gather*
N*
T0	*

axis *
_output_shapes
:
 
6linear/linear_model/success/weighted_sum/SparseReshapeSparseReshape)linear/linear_model/success/SparseReshape+linear/linear_model/success/SparseReshape:1/linear/linear_model/success/weighted_sum/Cast/x*-
_output_shapes
:         :
н
?linear/linear_model/success/weighted_sum/SparseReshape/IdentityIdentity2linear/linear_model/success/SparseReshape/Identity*
T0	*#
_output_shapes
:         
y
7linear/linear_model/success/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
э
5linear/linear_model/success/weighted_sum/GreaterEqualGreaterEqual?linear/linear_model/success/weighted_sum/SparseReshape/Identity7linear/linear_model/success/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:         
Ч
.linear/linear_model/success/weighted_sum/WhereWhere5linear/linear_model/success/weighted_sum/GreaterEqual*'
_output_shapes
:         
Й
6linear/linear_model/success/weighted_sum/Reshape/shapeConst*
valueB:
         *
dtype0*
_output_shapes
:
▀
0linear/linear_model/success/weighted_sum/ReshapeReshape.linear/linear_model/success/weighted_sum/Where6linear/linear_model/success/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:         
Е
1linear/linear_model/success/weighted_sum/Gather_1Gather6linear/linear_model/success/weighted_sum/SparseReshape0linear/linear_model/success/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:         
К
1linear/linear_model/success/weighted_sum/Gather_2Gather?linear/linear_model/success/weighted_sum/SparseReshape/Identity0linear/linear_model/success/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:         
Ь
1linear/linear_model/success/weighted_sum/IdentityIdentity8linear/linear_model/success/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
Д
Blinear/linear_model/success/weighted_sum/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
г
Plinear/linear_model/success/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRows1linear/linear_model/success/weighted_sum/Gather_11linear/linear_model/success/weighted_sum/Gather_21linear/linear_model/success/weighted_sum/IdentityBlinear/linear_model/success/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:         :         :         :         
е
Tlinear/linear_model/success/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
з
Vlinear/linear_model/success/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
з
Vlinear/linear_model/success/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
╒
Nlinear/linear_model/success/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSlicePlinear/linear_model/success/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsTlinear/linear_model/success/weighted_sum/embedding_lookup_sparse/strided_slice/stackVlinear/linear_model/success/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Vlinear/linear_model/success/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
T0	*
Index0*

begin_mask*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*#
_output_shapes
:         
┌
Elinear/linear_model/success/weighted_sum/embedding_lookup_sparse/CastCastNlinear/linear_model/success/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*

DstT0*#
_output_shapes
:         
ё
Glinear/linear_model/success/weighted_sum/embedding_lookup_sparse/UniqueUniqueRlinear/linear_model/success/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*
out_idx0*2
_output_shapes 
:         :         
Ї
Qlinear/linear_model/success/weighted_sum/embedding_lookup_sparse/embedding_lookupGather/linear/linear_model/success/weights/part_0/readGlinear/linear_model/success/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*=
_class3
1/loc:@linear/linear_model/success/weights/part_0*'
_output_shapes
:         
ў
@linear/linear_model/success/weighted_sum/embedding_lookup_sparseSparseSegmentSumQlinear/linear_model/success/weighted_sum/embedding_lookup_sparse/embedding_lookupIlinear/linear_model/success/weighted_sum/embedding_lookup_sparse/Unique:1Elinear/linear_model/success/weighted_sum/embedding_lookup_sparse/Cast*
T0*

Tidx0*'
_output_shapes
:         
Й
8linear/linear_model/success/weighted_sum/Reshape_1/shapeConst*
valueB"       *
dtype0*
_output_shapes
:
Л
2linear/linear_model/success/weighted_sum/Reshape_1ReshapeRlinear/linear_model/success/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:28linear/linear_model/success/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:         
о
.linear/linear_model/success/weighted_sum/ShapeShape@linear/linear_model/success/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
Ж
<linear/linear_model/success/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
И
>linear/linear_model/success/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
И
>linear/linear_model/success/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
╞
6linear/linear_model/success/weighted_sum/strided_sliceStridedSlice.linear/linear_model/success/weighted_sum/Shape<linear/linear_model/success/weighted_sum/strided_slice/stack>linear/linear_model/success/weighted_sum/strided_slice/stack_1>linear/linear_model/success/weighted_sum/strided_slice/stack_2*
T0*
Index0*

begin_mask *
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
_output_shapes
: 
r
0linear/linear_model/success/weighted_sum/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
┌
.linear/linear_model/success/weighted_sum/stackPack0linear/linear_model/success/weighted_sum/stack/06linear/linear_model/success/weighted_sum/strided_slice*
N*
T0*

axis *
_output_shapes
:
ц
-linear/linear_model/success/weighted_sum/TileTile2linear/linear_model/success/weighted_sum/Reshape_1.linear/linear_model/success/weighted_sum/stack*
T0
*

Tmultiples0*0
_output_shapes
:                  
┤
3linear/linear_model/success/weighted_sum/zeros_like	ZerosLike@linear/linear_model/success/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:         
К
(linear/linear_model/success/weighted_sumSelect-linear/linear_model/success/weighted_sum/Tile3linear/linear_model/success/weighted_sum/zeros_like@linear/linear_model/success/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:         
Ш
/linear/linear_model/success/weighted_sum/Cast_1Cast+linear/linear_model/success/SparseReshape:1*

SrcT0	*

DstT0*
_output_shapes
:
А
6linear/linear_model/success/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:

5linear/linear_model/success/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
Л
0linear/linear_model/success/weighted_sum/Slice_1Slice/linear/linear_model/success/weighted_sum/Cast_16linear/linear_model/success/weighted_sum/Slice_1/begin5linear/linear_model/success/weighted_sum/Slice_1/size*
T0*
Index0*
_output_shapes
:
Ш
0linear/linear_model/success/weighted_sum/Shape_1Shape(linear/linear_model/success/weighted_sum*
T0*
out_type0*
_output_shapes
:
А
6linear/linear_model/success/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
И
5linear/linear_model/success/weighted_sum/Slice_2/sizeConst*
valueB:
         *
dtype0*
_output_shapes
:
М
0linear/linear_model/success/weighted_sum/Slice_2Slice0linear/linear_model/success/weighted_sum/Shape_16linear/linear_model/success/weighted_sum/Slice_2/begin5linear/linear_model/success/weighted_sum/Slice_2/size*
T0*
Index0*
_output_shapes
:
v
4linear/linear_model/success/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
П
/linear/linear_model/success/weighted_sum/concatConcatV20linear/linear_model/success/weighted_sum/Slice_10linear/linear_model/success/weighted_sum/Slice_24linear/linear_model/success/weighted_sum/concat/axis*
N*
T0*

Tidx0*
_output_shapes
:
╪
2linear/linear_model/success/weighted_sum/Reshape_2Reshape(linear/linear_model/success/weighted_sum/linear/linear_model/success/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:         
Ф
#linear/linear_model/username/lookupStringToHashBucketFastParseExample/ParseExample:13*
num_bucketsш*#
_output_shapes
:         
Б
'linear/linear_model/username/Shape/CastCastParseExample/ParseExample:20*

SrcT0	*

DstT0*
_output_shapes
:
z
0linear/linear_model/username/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
|
2linear/linear_model/username/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
|
2linear/linear_model/username/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
П
*linear/linear_model/username/strided_sliceStridedSlice'linear/linear_model/username/Shape/Cast0linear/linear_model/username/strided_slice/stack2linear/linear_model/username/strided_slice/stack_12linear/linear_model/username/strided_slice/stack_2*
T0*
Index0*

begin_mask *
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
_output_shapes
: 
p
%linear/linear_model/username/Cast/x/1Const*
valueB :
         *
dtype0*
_output_shapes
: 
╕
#linear/linear_model/username/Cast/xPack*linear/linear_model/username/strided_slice%linear/linear_model/username/Cast/x/1*
N*
T0*

axis *
_output_shapes
:
В
!linear/linear_model/username/CastCast#linear/linear_model/username/Cast/x*

SrcT0*

DstT0	*
_output_shapes
:
╚
*linear/linear_model/username/SparseReshapeSparseReshapeParseExample/ParseExample:6ParseExample/ParseExample:20!linear/linear_model/username/Cast*-
_output_shapes
:         :
Т
3linear/linear_model/username/SparseReshape/IdentityIdentity#linear/linear_model/username/lookup*
T0	*#
_output_shapes
:         
╘
=linear/linear_model/username/weights/part_0/Initializer/zerosConst*
valueB	ш*    *
dtype0*>
_class4
20loc:@linear/linear_model/username/weights/part_0*
_output_shapes
:	ш
с
+linear/linear_model/username/weights/part_0
VariableV2*
shape:	ш*
dtype0*
	container *
shared_name *>
_class4
20loc:@linear/linear_model/username/weights/part_0*
_output_shapes
:	ш
╗
2linear/linear_model/username/weights/part_0/AssignAssign+linear/linear_model/username/weights/part_0=linear/linear_model/username/weights/part_0/Initializer/zeros*
T0*
validate_shape(*
use_locking(*>
_class4
20loc:@linear/linear_model/username/weights/part_0*
_output_shapes
:	ш
╙
0linear/linear_model/username/weights/part_0/readIdentity+linear/linear_model/username/weights/part_0*
T0*>
_class4
20loc:@linear/linear_model/username/weights/part_0*
_output_shapes
:	ш

5linear/linear_model/username/weighted_sum/Slice/beginConst*
valueB: *
dtype0*
_output_shapes
:
~
4linear/linear_model/username/weighted_sum/Slice/sizeConst*
valueB:*
dtype0*
_output_shapes
:
Е
/linear/linear_model/username/weighted_sum/SliceSlice,linear/linear_model/username/SparseReshape:15linear/linear_model/username/weighted_sum/Slice/begin4linear/linear_model/username/weighted_sum/Slice/size*
T0	*
Index0*
_output_shapes
:
y
/linear/linear_model/username/weighted_sum/ConstConst*
valueB: *
dtype0*
_output_shapes
:
╓
.linear/linear_model/username/weighted_sum/ProdProd/linear/linear_model/username/weighted_sum/Slice/linear/linear_model/username/weighted_sum/Const*
	keep_dims( *
T0	*

Tidx0*
_output_shapes
: 
z
8linear/linear_model/username/weighted_sum/Gather/indicesConst*
value	B :*
dtype0*
_output_shapes
: 
ё
0linear/linear_model/username/weighted_sum/GatherGather,linear/linear_model/username/SparseReshape:18linear/linear_model/username/weighted_sum/Gather/indices*
validate_indices(*
Tparams0	*
Tindices0*
_output_shapes
: 
╘
0linear/linear_model/username/weighted_sum/Cast/xPack.linear/linear_model/username/weighted_sum/Prod0linear/linear_model/username/weighted_sum/Gather*
N*
T0	*

axis *
_output_shapes
:
Г
7linear/linear_model/username/weighted_sum/SparseReshapeSparseReshape*linear/linear_model/username/SparseReshape,linear/linear_model/username/SparseReshape:10linear/linear_model/username/weighted_sum/Cast/x*-
_output_shapes
:         :
п
@linear/linear_model/username/weighted_sum/SparseReshape/IdentityIdentity3linear/linear_model/username/SparseReshape/Identity*
T0	*#
_output_shapes
:         
z
8linear/linear_model/username/weighted_sum/GreaterEqual/yConst*
value	B	 R *
dtype0	*
_output_shapes
: 
Ё
6linear/linear_model/username/weighted_sum/GreaterEqualGreaterEqual@linear/linear_model/username/weighted_sum/SparseReshape/Identity8linear/linear_model/username/weighted_sum/GreaterEqual/y*
T0	*#
_output_shapes
:         
Щ
/linear/linear_model/username/weighted_sum/WhereWhere6linear/linear_model/username/weighted_sum/GreaterEqual*'
_output_shapes
:         
К
7linear/linear_model/username/weighted_sum/Reshape/shapeConst*
valueB:
         *
dtype0*
_output_shapes
:
т
1linear/linear_model/username/weighted_sum/ReshapeReshape/linear/linear_model/username/weighted_sum/Where7linear/linear_model/username/weighted_sum/Reshape/shape*
T0	*
Tshape0*#
_output_shapes
:         
И
2linear/linear_model/username/weighted_sum/Gather_1Gather7linear/linear_model/username/weighted_sum/SparseReshape1linear/linear_model/username/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*'
_output_shapes
:         
Н
2linear/linear_model/username/weighted_sum/Gather_2Gather@linear/linear_model/username/weighted_sum/SparseReshape/Identity1linear/linear_model/username/weighted_sum/Reshape*
validate_indices(*
Tparams0	*
Tindices0	*#
_output_shapes
:         
Ю
2linear/linear_model/username/weighted_sum/IdentityIdentity9linear/linear_model/username/weighted_sum/SparseReshape:1*
T0	*
_output_shapes
:
Е
Clinear/linear_model/username/weighted_sum/SparseFillEmptyRows/ConstConst*
value	B	 R *
dtype0	*
_output_shapes
: 
и
Qlinear/linear_model/username/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsSparseFillEmptyRows2linear/linear_model/username/weighted_sum/Gather_12linear/linear_model/username/weighted_sum/Gather_22linear/linear_model/username/weighted_sum/IdentityClinear/linear_model/username/weighted_sum/SparseFillEmptyRows/Const*
T0	*T
_output_shapesB
@:         :         :         :         
ж
Ulinear/linear_model/username/weighted_sum/embedding_lookup_sparse/strided_slice/stackConst*
valueB"        *
dtype0*
_output_shapes
:
и
Wlinear/linear_model/username/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Const*
valueB"       *
dtype0*
_output_shapes
:
и
Wlinear/linear_model/username/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2Const*
valueB"      *
dtype0*
_output_shapes
:
┌
Olinear/linear_model/username/weighted_sum/embedding_lookup_sparse/strided_sliceStridedSliceQlinear/linear_model/username/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRowsUlinear/linear_model/username/weighted_sum/embedding_lookup_sparse/strided_slice/stackWlinear/linear_model/username/weighted_sum/embedding_lookup_sparse/strided_slice/stack_1Wlinear/linear_model/username/weighted_sum/embedding_lookup_sparse/strided_slice/stack_2*
T0	*
Index0*

begin_mask*
end_mask*
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*#
_output_shapes
:         
▄
Flinear/linear_model/username/weighted_sum/embedding_lookup_sparse/CastCastOlinear/linear_model/username/weighted_sum/embedding_lookup_sparse/strided_slice*

SrcT0	*

DstT0*#
_output_shapes
:         
є
Hlinear/linear_model/username/weighted_sum/embedding_lookup_sparse/UniqueUniqueSlinear/linear_model/username/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:1*
T0	*
out_idx0*2
_output_shapes 
:         :         
°
Rlinear/linear_model/username/weighted_sum/embedding_lookup_sparse/embedding_lookupGather0linear/linear_model/username/weights/part_0/readHlinear/linear_model/username/weighted_sum/embedding_lookup_sparse/Unique*
validate_indices(*
Tparams0*
Tindices0	*>
_class4
20loc:@linear/linear_model/username/weights/part_0*'
_output_shapes
:         
√
Alinear/linear_model/username/weighted_sum/embedding_lookup_sparseSparseSegmentSumRlinear/linear_model/username/weighted_sum/embedding_lookup_sparse/embedding_lookupJlinear/linear_model/username/weighted_sum/embedding_lookup_sparse/Unique:1Flinear/linear_model/username/weighted_sum/embedding_lookup_sparse/Cast*
T0*

Tidx0*'
_output_shapes
:         
К
9linear/linear_model/username/weighted_sum/Reshape_1/shapeConst*
valueB"       *
dtype0*
_output_shapes
:
О
3linear/linear_model/username/weighted_sum/Reshape_1ReshapeSlinear/linear_model/username/weighted_sum/SparseFillEmptyRows/SparseFillEmptyRows:29linear/linear_model/username/weighted_sum/Reshape_1/shape*
T0
*
Tshape0*'
_output_shapes
:         
░
/linear/linear_model/username/weighted_sum/ShapeShapeAlinear/linear_model/username/weighted_sum/embedding_lookup_sparse*
T0*
out_type0*
_output_shapes
:
З
=linear/linear_model/username/weighted_sum/strided_slice/stackConst*
valueB:*
dtype0*
_output_shapes
:
Й
?linear/linear_model/username/weighted_sum/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
Й
?linear/linear_model/username/weighted_sum/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
╦
7linear/linear_model/username/weighted_sum/strided_sliceStridedSlice/linear/linear_model/username/weighted_sum/Shape=linear/linear_model/username/weighted_sum/strided_slice/stack?linear/linear_model/username/weighted_sum/strided_slice/stack_1?linear/linear_model/username/weighted_sum/strided_slice/stack_2*
T0*
Index0*

begin_mask *
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
_output_shapes
: 
s
1linear/linear_model/username/weighted_sum/stack/0Const*
value	B :*
dtype0*
_output_shapes
: 
▌
/linear/linear_model/username/weighted_sum/stackPack1linear/linear_model/username/weighted_sum/stack/07linear/linear_model/username/weighted_sum/strided_slice*
N*
T0*

axis *
_output_shapes
:
щ
.linear/linear_model/username/weighted_sum/TileTile3linear/linear_model/username/weighted_sum/Reshape_1/linear/linear_model/username/weighted_sum/stack*
T0
*

Tmultiples0*0
_output_shapes
:                  
╢
4linear/linear_model/username/weighted_sum/zeros_like	ZerosLikeAlinear/linear_model/username/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:         
О
)linear/linear_model/username/weighted_sumSelect.linear/linear_model/username/weighted_sum/Tile4linear/linear_model/username/weighted_sum/zeros_likeAlinear/linear_model/username/weighted_sum/embedding_lookup_sparse*
T0*'
_output_shapes
:         
Ъ
0linear/linear_model/username/weighted_sum/Cast_1Cast,linear/linear_model/username/SparseReshape:1*

SrcT0	*

DstT0*
_output_shapes
:
Б
7linear/linear_model/username/weighted_sum/Slice_1/beginConst*
valueB: *
dtype0*
_output_shapes
:
А
6linear/linear_model/username/weighted_sum/Slice_1/sizeConst*
valueB:*
dtype0*
_output_shapes
:
П
1linear/linear_model/username/weighted_sum/Slice_1Slice0linear/linear_model/username/weighted_sum/Cast_17linear/linear_model/username/weighted_sum/Slice_1/begin6linear/linear_model/username/weighted_sum/Slice_1/size*
T0*
Index0*
_output_shapes
:
Ъ
1linear/linear_model/username/weighted_sum/Shape_1Shape)linear/linear_model/username/weighted_sum*
T0*
out_type0*
_output_shapes
:
Б
7linear/linear_model/username/weighted_sum/Slice_2/beginConst*
valueB:*
dtype0*
_output_shapes
:
Й
6linear/linear_model/username/weighted_sum/Slice_2/sizeConst*
valueB:
         *
dtype0*
_output_shapes
:
Р
1linear/linear_model/username/weighted_sum/Slice_2Slice1linear/linear_model/username/weighted_sum/Shape_17linear/linear_model/username/weighted_sum/Slice_2/begin6linear/linear_model/username/weighted_sum/Slice_2/size*
T0*
Index0*
_output_shapes
:
w
5linear/linear_model/username/weighted_sum/concat/axisConst*
value	B : *
dtype0*
_output_shapes
: 
У
0linear/linear_model/username/weighted_sum/concatConcatV21linear/linear_model/username/weighted_sum/Slice_11linear/linear_model/username/weighted_sum/Slice_25linear/linear_model/username/weighted_sum/concat/axis*
N*
T0*

Tidx0*
_output_shapes
:
█
3linear/linear_model/username/weighted_sum/Reshape_2Reshape)linear/linear_model/username/weighted_sum0linear/linear_model/username/weighted_sum/concat*
T0*
Tshape0*'
_output_shapes
:         
▌
(linear/linear_model/weighted_sum_no_biasAddN6linear/linear_model/auth_method/weighted_sum/Reshape_22linear/linear_model/country/weighted_sum/Reshape_27linear/linear_model/invalid_user/weighted_sum/Reshape_2-linear/linear_model/ip/weighted_sum/Reshape_23linear/linear_model/provider/weighted_sum/Reshape_22linear/linear_model/success/weighted_sum/Reshape_23linear/linear_model/username/weighted_sum/Reshape_2*
N*
T0*'
_output_shapes
:         
┬
9linear/linear_model/bias_weights/part_0/Initializer/zerosConst*
valueB*    *
dtype0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
_output_shapes
:
╧
'linear/linear_model/bias_weights/part_0
VariableV2*
shape:*
dtype0*
	container *
shared_name *:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
_output_shapes
:
ж
.linear/linear_model/bias_weights/part_0/AssignAssign'linear/linear_model/bias_weights/part_09linear/linear_model/bias_weights/part_0/Initializer/zeros*
T0*
validate_shape(*
use_locking(*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
_output_shapes
:
┬
,linear/linear_model/bias_weights/part_0/readIdentity'linear/linear_model/bias_weights/part_0*
T0*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
_output_shapes
:

 linear/linear_model/bias_weightsIdentity,linear/linear_model/bias_weights/part_0/read*
T0*
_output_shapes
:
└
 linear/linear_model/weighted_sumBiasAdd(linear/linear_model/weighted_sum_no_bias linear/linear_model/bias_weights*
T0*
data_formatNHWC*'
_output_shapes
:         
Д
$linear/head/predictions/logits/ShapeShape linear/linear_model/weighted_sum*
T0*
out_type0*
_output_shapes
:
q
/linear/head/predictions/logits/assert_rank/rankConst*
value	B :*
dtype0*
_output_shapes
: 
a
Ylinear/head/predictions/logits/assert_rank/assert_type/statically_determined_correct_typeNoOp
R
Jlinear/head/predictions/logits/assert_rank/static_checks_determined_all_okNoOp
╔
2linear/head/predictions/logits/strided_slice/stackConstK^linear/head/predictions/logits/assert_rank/static_checks_determined_all_ok*
valueB:*
dtype0*
_output_shapes
:
╦
4linear/head/predictions/logits/strided_slice/stack_1ConstK^linear/head/predictions/logits/assert_rank/static_checks_determined_all_ok*
valueB:*
dtype0*
_output_shapes
:
╦
4linear/head/predictions/logits/strided_slice/stack_2ConstK^linear/head/predictions/logits/assert_rank/static_checks_determined_all_ok*
valueB:*
dtype0*
_output_shapes
:
Ф
,linear/head/predictions/logits/strided_sliceStridedSlice$linear/head/predictions/logits/Shape2linear/head/predictions/logits/strided_slice/stack4linear/head/predictions/logits/strided_slice/stack_14linear/head/predictions/logits/strided_slice/stack_2*
T0*
Index0*

begin_mask *
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
_output_shapes
: 
╝
-linear/head/predictions/logits/assert_equal/xConstK^linear/head/predictions/logits/assert_rank/static_checks_determined_all_ok*
value	B :*
dtype0*
_output_shapes
: 
╕
1linear/head/predictions/logits/assert_equal/EqualEqual-linear/head/predictions/logits/assert_equal/x,linear/head/predictions/logits/strided_slice*
T0*
_output_shapes
: 
┴
1linear/head/predictions/logits/assert_equal/ConstConstK^linear/head/predictions/logits/assert_rank/static_checks_determined_all_ok*
valueB *
dtype0*
_output_shapes
: 
╤
/linear/head/predictions/logits/assert_equal/AllAll1linear/head/predictions/logits/assert_equal/Equal1linear/head/predictions/logits/assert_equal/Const*
	keep_dims( *

Tidx0*
_output_shapes
: 
╖
9linear/head/predictions/logits/assert_equal/Assert/AssertAssert/linear/head/predictions/logits/assert_equal/All$linear/head/predictions/logits/Shape*

T
2*
	summarize
З
linear/head/predictions/logitsIdentity linear/linear_model/weighted_sumK^linear/head/predictions/logits/assert_rank/static_checks_determined_all_ok:^linear/head/predictions/logits/assert_equal/Assert/Assert*
T0*'
_output_shapes
:         
}
 linear/head/predictions/logisticSigmoidlinear/head/predictions/logits*
T0*'
_output_shapes
:         
Б
"linear/head/predictions/zeros_like	ZerosLikelinear/head/predictions/logits*
T0*'
_output_shapes
:         
o
-linear/head/predictions/two_class_logits/axisConst*
value	B :*
dtype0*
_output_shapes
: 
ю
(linear/head/predictions/two_class_logitsConcatV2"linear/head/predictions/zeros_likelinear/head/predictions/logits-linear/head/predictions/two_class_logits/axis*
N*
T0*

Tidx0*'
_output_shapes
:         
М
%linear/head/predictions/probabilitiesSoftmax(linear/head/predictions/two_class_logits*
T0*'
_output_shapes
:         
j
(linear/head/predictions/ArgMax/dimensionConst*
value	B :*
dtype0*
_output_shapes
: 
╔
linear/head/predictions/ArgMaxArgMax(linear/head/predictions/two_class_logits(linear/head/predictions/ArgMax/dimension*
T0*

Tidx0*
output_type0	*#
_output_shapes
:         
v
%linear/head/predictions/classes/shapeConst*
valueB"       *
dtype0*
_output_shapes
:
▒
linear/head/predictions/classesReshapelinear/head/predictions/ArgMax%linear/head/predictions/classes/shape*
T0	*
Tshape0*'
_output_shapes
:         
р
#linear/head/predictions/str_classesAsStringlinear/head/predictions/classes*
T0	*
	precision         *

scientific( *
shortest( *
width         *

fill *'
_output_shapes
:         
q
linear/head/ShapeShape linear/head/predictions/logistic*
T0*
out_type0*
_output_shapes
:
i
linear/head/strided_slice/stackConst*
valueB: *
dtype0*
_output_shapes
:
k
!linear/head/strided_slice/stack_1Const*
valueB:*
dtype0*
_output_shapes
:
k
!linear/head/strided_slice/stack_2Const*
valueB:*
dtype0*
_output_shapes
:
╡
linear/head/strided_sliceStridedSlicelinear/head/Shapelinear/head/strided_slice/stack!linear/head/strided_slice/stack_1!linear/head/strided_slice/stack_2*
T0*
Index0*

begin_mask *
end_mask *
ellipsis_mask *
new_axis_mask *
shrink_axis_mask*
_output_shapes
: 
k
linear/head/AsString/inputConst*
valueB"       *
dtype0*
_output_shapes
:
┐
linear/head/AsStringAsStringlinear/head/AsString/input*
T0*
	precision         *

scientific( *
shortest( *
width         *

fill *
_output_shapes
:
\
linear/head/ExpandDims/dimConst*
value	B : *
dtype0*
_output_shapes
: 
Л
linear/head/ExpandDims
ExpandDimslinear/head/AsStringlinear/head/ExpandDims/dim*
T0*

Tdim0*
_output_shapes

:
^
linear/head/Tile/multiples/1Const*
value	B :*
dtype0*
_output_shapes
: 
Х
linear/head/Tile/multiplesPacklinear/head/strided_slicelinear/head/Tile/multiples/1*
N*
T0*

axis *
_output_shapes
:
Р
linear/head/TileTilelinear/head/ExpandDimslinear/head/Tile/multiples*
T0*

Tmultiples0*'
_output_shapes
:         
P

save/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
Д
save/StringJoin/inputs_1Const*<
value3B1 B+_temp_f79d203e8d0c464baaa6fa377272b1b3/part*
dtype0*
_output_shapes
: 
u
save/StringJoin
StringJoin
save/Constsave/StringJoin/inputs_1*
N*
	separator *
_output_shapes
: 
Q
save/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
\
save/ShardedFilename/shardConst*
value	B : *
dtype0*
_output_shapes
: 
}
save/ShardedFilenameShardedFilenamesave/StringJoinsave/ShardedFilename/shardsave/num_shards*
_output_shapes
: 
Ъ
save/SaveV2/tensor_namesConst*═
value├B└	Bglobal_stepB'linear/linear_model/auth_method/weightsB linear/linear_model/bias_weightsB#linear/linear_model/country/weightsB(linear/linear_model/invalid_user/weightsBlinear/linear_model/ip/weightsB$linear/linear_model/provider/weightsB#linear/linear_model/success/weightsB$linear/linear_model/username/weights*
dtype0*
_output_shapes
:	
т
save/SaveV2/shape_and_slicesConst*С
valueЗBД	B B2 1 0,2:0,1B1 0,1B1000 1 0,1000:0,1B2 1 0,2:0,1B5000 1 0,5000:0,1B1000 1 0,1000:0,1B2 1 0,2:0,1B1000 1 0,1000:0,1*
dtype0*
_output_shapes
:	
Ф
save/SaveV2SaveV2save/ShardedFilenamesave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesglobal_step3linear/linear_model/auth_method/weights/part_0/read,linear/linear_model/bias_weights/part_0/read/linear/linear_model/country/weights/part_0/read4linear/linear_model/invalid_user/weights/part_0/read*linear/linear_model/ip/weights/part_0/read0linear/linear_model/provider/weights/part_0/read/linear/linear_model/success/weights/part_0/read0linear/linear_model/username/weights/part_0/read*
dtypes
2		
С
save/control_dependencyIdentitysave/ShardedFilename^save/SaveV2*
T0*'
_class
loc:@save/ShardedFilename*
_output_shapes
: 
Э
+save/MergeV2Checkpoints/checkpoint_prefixesPacksave/ShardedFilename^save/control_dependency*
N*
T0*

axis *
_output_shapes
:
}
save/MergeV2CheckpointsMergeV2Checkpoints+save/MergeV2Checkpoints/checkpoint_prefixes
save/Const*
delete_old_dirs(
z
save/IdentityIdentity
save/Const^save/control_dependency^save/MergeV2Checkpoints*
T0*
_output_shapes
: 
o
save/RestoreV2/tensor_namesConst* 
valueBBglobal_step*
dtype0*
_output_shapes
:
h
save/RestoreV2/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Р
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices*
dtypes
2	*
_output_shapes
:
Ь
save/AssignAssignglobal_stepsave/RestoreV2*
T0	*
validate_shape(*
use_locking(*
_class
loc:@global_step*
_output_shapes
: 
Н
save/RestoreV2_1/tensor_namesConst*<
value3B1B'linear/linear_model/auth_method/weights*
dtype0*
_output_shapes
:
u
!save/RestoreV2_1/shape_and_slicesConst* 
valueBB2 1 0,2:0,1*
dtype0*
_output_shapes
:
Ь
save/RestoreV2_1	RestoreV2
save/Constsave/RestoreV2_1/tensor_names!save/RestoreV2_1/shape_and_slices*
dtypes
2*
_output_shapes

:
ю
save/Assign_1Assign.linear/linear_model/auth_method/weights/part_0save/RestoreV2_1*
T0*
validate_shape(*
use_locking(*A
_class7
53loc:@linear/linear_model/auth_method/weights/part_0*
_output_shapes

:
Ж
save/RestoreV2_2/tensor_namesConst*5
value,B*B linear/linear_model/bias_weights*
dtype0*
_output_shapes
:
o
!save/RestoreV2_2/shape_and_slicesConst*
valueBB1 0,1*
dtype0*
_output_shapes
:
Ш
save/RestoreV2_2	RestoreV2
save/Constsave/RestoreV2_2/tensor_names!save/RestoreV2_2/shape_and_slices*
dtypes
2*
_output_shapes
:
▄
save/Assign_2Assign'linear/linear_model/bias_weights/part_0save/RestoreV2_2*
T0*
validate_shape(*
use_locking(*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
_output_shapes
:
Й
save/RestoreV2_3/tensor_namesConst*8
value/B-B#linear/linear_model/country/weights*
dtype0*
_output_shapes
:
{
!save/RestoreV2_3/shape_and_slicesConst*&
valueBB1000 1 0,1000:0,1*
dtype0*
_output_shapes
:
Э
save/RestoreV2_3	RestoreV2
save/Constsave/RestoreV2_3/tensor_names!save/RestoreV2_3/shape_and_slices*
dtypes
2*
_output_shapes
:	ш
ч
save/Assign_3Assign*linear/linear_model/country/weights/part_0save/RestoreV2_3*
T0*
validate_shape(*
use_locking(*=
_class3
1/loc:@linear/linear_model/country/weights/part_0*
_output_shapes
:	ш
О
save/RestoreV2_4/tensor_namesConst*=
value4B2B(linear/linear_model/invalid_user/weights*
dtype0*
_output_shapes
:
u
!save/RestoreV2_4/shape_and_slicesConst* 
valueBB2 1 0,2:0,1*
dtype0*
_output_shapes
:
Ь
save/RestoreV2_4	RestoreV2
save/Constsave/RestoreV2_4/tensor_names!save/RestoreV2_4/shape_and_slices*
dtypes
2*
_output_shapes

:
Ё
save/Assign_4Assign/linear/linear_model/invalid_user/weights/part_0save/RestoreV2_4*
T0*
validate_shape(*
use_locking(*B
_class8
64loc:@linear/linear_model/invalid_user/weights/part_0*
_output_shapes

:
Д
save/RestoreV2_5/tensor_namesConst*3
value*B(Blinear/linear_model/ip/weights*
dtype0*
_output_shapes
:
{
!save/RestoreV2_5/shape_and_slicesConst*&
valueBB5000 1 0,5000:0,1*
dtype0*
_output_shapes
:
Э
save/RestoreV2_5	RestoreV2
save/Constsave/RestoreV2_5/tensor_names!save/RestoreV2_5/shape_and_slices*
dtypes
2*
_output_shapes
:	И'
▌
save/Assign_5Assign%linear/linear_model/ip/weights/part_0save/RestoreV2_5*
T0*
validate_shape(*
use_locking(*8
_class.
,*loc:@linear/linear_model/ip/weights/part_0*
_output_shapes
:	И'
К
save/RestoreV2_6/tensor_namesConst*9
value0B.B$linear/linear_model/provider/weights*
dtype0*
_output_shapes
:
{
!save/RestoreV2_6/shape_and_slicesConst*&
valueBB1000 1 0,1000:0,1*
dtype0*
_output_shapes
:
Э
save/RestoreV2_6	RestoreV2
save/Constsave/RestoreV2_6/tensor_names!save/RestoreV2_6/shape_and_slices*
dtypes
2*
_output_shapes
:	ш
щ
save/Assign_6Assign+linear/linear_model/provider/weights/part_0save/RestoreV2_6*
T0*
validate_shape(*
use_locking(*>
_class4
20loc:@linear/linear_model/provider/weights/part_0*
_output_shapes
:	ш
Й
save/RestoreV2_7/tensor_namesConst*8
value/B-B#linear/linear_model/success/weights*
dtype0*
_output_shapes
:
u
!save/RestoreV2_7/shape_and_slicesConst* 
valueBB2 1 0,2:0,1*
dtype0*
_output_shapes
:
Ь
save/RestoreV2_7	RestoreV2
save/Constsave/RestoreV2_7/tensor_names!save/RestoreV2_7/shape_and_slices*
dtypes
2*
_output_shapes

:
ц
save/Assign_7Assign*linear/linear_model/success/weights/part_0save/RestoreV2_7*
T0*
validate_shape(*
use_locking(*=
_class3
1/loc:@linear/linear_model/success/weights/part_0*
_output_shapes

:
К
save/RestoreV2_8/tensor_namesConst*9
value0B.B$linear/linear_model/username/weights*
dtype0*
_output_shapes
:
{
!save/RestoreV2_8/shape_and_slicesConst*&
valueBB1000 1 0,1000:0,1*
dtype0*
_output_shapes
:
Э
save/RestoreV2_8	RestoreV2
save/Constsave/RestoreV2_8/tensor_names!save/RestoreV2_8/shape_and_slices*
dtypes
2*
_output_shapes
:	ш
щ
save/Assign_8Assign+linear/linear_model/username/weights/part_0save/RestoreV2_8*
T0*
validate_shape(*
use_locking(*>
_class4
20loc:@linear/linear_model/username/weights/part_0*
_output_shapes
:	ш
и
save/restore_shardNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8
-
save/restore_allNoOp^save/restore_shard

initNoOp
Є
init_all_tablesNoOpI^linear/linear_model/auth_method/auth_method_lookup/hash_table/table_initK^linear/linear_model/invalid_user/invalid_user_lookup/hash_table/table_initA^linear/linear_model/success/success_lookup/hash_table/table_init
+

group_depsNoOp^init^init_all_tables
R
save_1/ConstConst*
valueB Bmodel*
dtype0*
_output_shapes
: 
Ж
save_1/StringJoin/inputs_1Const*<
value3B1 B+_temp_089328ee04ba498a9420fc267ee63d1e/part*
dtype0*
_output_shapes
: 
{
save_1/StringJoin
StringJoinsave_1/Constsave_1/StringJoin/inputs_1*
N*
	separator *
_output_shapes
: 
S
save_1/num_shardsConst*
value	B :*
dtype0*
_output_shapes
: 
^
save_1/ShardedFilename/shardConst*
value	B : *
dtype0*
_output_shapes
: 
Е
save_1/ShardedFilenameShardedFilenamesave_1/StringJoinsave_1/ShardedFilename/shardsave_1/num_shards*
_output_shapes
: 
Ь
save_1/SaveV2/tensor_namesConst*═
value├B└	Bglobal_stepB'linear/linear_model/auth_method/weightsB linear/linear_model/bias_weightsB#linear/linear_model/country/weightsB(linear/linear_model/invalid_user/weightsBlinear/linear_model/ip/weightsB$linear/linear_model/provider/weightsB#linear/linear_model/success/weightsB$linear/linear_model/username/weights*
dtype0*
_output_shapes
:	
ф
save_1/SaveV2/shape_and_slicesConst*С
valueЗBД	B B2 1 0,2:0,1B1 0,1B1000 1 0,1000:0,1B2 1 0,2:0,1B5000 1 0,5000:0,1B1000 1 0,1000:0,1B2 1 0,2:0,1B1000 1 0,1000:0,1*
dtype0*
_output_shapes
:	
Ь
save_1/SaveV2SaveV2save_1/ShardedFilenamesave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slicesglobal_step3linear/linear_model/auth_method/weights/part_0/read,linear/linear_model/bias_weights/part_0/read/linear/linear_model/country/weights/part_0/read4linear/linear_model/invalid_user/weights/part_0/read*linear/linear_model/ip/weights/part_0/read0linear/linear_model/provider/weights/part_0/read/linear/linear_model/success/weights/part_0/read0linear/linear_model/username/weights/part_0/read*
dtypes
2		
Щ
save_1/control_dependencyIdentitysave_1/ShardedFilename^save_1/SaveV2*
T0*)
_class
loc:@save_1/ShardedFilename*
_output_shapes
: 
г
-save_1/MergeV2Checkpoints/checkpoint_prefixesPacksave_1/ShardedFilename^save_1/control_dependency*
N*
T0*

axis *
_output_shapes
:
Г
save_1/MergeV2CheckpointsMergeV2Checkpoints-save_1/MergeV2Checkpoints/checkpoint_prefixessave_1/Const*
delete_old_dirs(
В
save_1/IdentityIdentitysave_1/Const^save_1/control_dependency^save_1/MergeV2Checkpoints*
T0*
_output_shapes
: 
q
save_1/RestoreV2/tensor_namesConst* 
valueBBglobal_step*
dtype0*
_output_shapes
:
j
!save_1/RestoreV2/shape_and_slicesConst*
valueB
B *
dtype0*
_output_shapes
:
Ш
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices*
dtypes
2	*
_output_shapes
:
а
save_1/AssignAssignglobal_stepsave_1/RestoreV2*
T0	*
validate_shape(*
use_locking(*
_class
loc:@global_step*
_output_shapes
: 
П
save_1/RestoreV2_1/tensor_namesConst*<
value3B1B'linear/linear_model/auth_method/weights*
dtype0*
_output_shapes
:
w
#save_1/RestoreV2_1/shape_and_slicesConst* 
valueBB2 1 0,2:0,1*
dtype0*
_output_shapes
:
д
save_1/RestoreV2_1	RestoreV2save_1/Constsave_1/RestoreV2_1/tensor_names#save_1/RestoreV2_1/shape_and_slices*
dtypes
2*
_output_shapes

:
Є
save_1/Assign_1Assign.linear/linear_model/auth_method/weights/part_0save_1/RestoreV2_1*
T0*
validate_shape(*
use_locking(*A
_class7
53loc:@linear/linear_model/auth_method/weights/part_0*
_output_shapes

:
И
save_1/RestoreV2_2/tensor_namesConst*5
value,B*B linear/linear_model/bias_weights*
dtype0*
_output_shapes
:
q
#save_1/RestoreV2_2/shape_and_slicesConst*
valueBB1 0,1*
dtype0*
_output_shapes
:
а
save_1/RestoreV2_2	RestoreV2save_1/Constsave_1/RestoreV2_2/tensor_names#save_1/RestoreV2_2/shape_and_slices*
dtypes
2*
_output_shapes
:
р
save_1/Assign_2Assign'linear/linear_model/bias_weights/part_0save_1/RestoreV2_2*
T0*
validate_shape(*
use_locking(*:
_class0
.,loc:@linear/linear_model/bias_weights/part_0*
_output_shapes
:
Л
save_1/RestoreV2_3/tensor_namesConst*8
value/B-B#linear/linear_model/country/weights*
dtype0*
_output_shapes
:
}
#save_1/RestoreV2_3/shape_and_slicesConst*&
valueBB1000 1 0,1000:0,1*
dtype0*
_output_shapes
:
е
save_1/RestoreV2_3	RestoreV2save_1/Constsave_1/RestoreV2_3/tensor_names#save_1/RestoreV2_3/shape_and_slices*
dtypes
2*
_output_shapes
:	ш
ы
save_1/Assign_3Assign*linear/linear_model/country/weights/part_0save_1/RestoreV2_3*
T0*
validate_shape(*
use_locking(*=
_class3
1/loc:@linear/linear_model/country/weights/part_0*
_output_shapes
:	ш
Р
save_1/RestoreV2_4/tensor_namesConst*=
value4B2B(linear/linear_model/invalid_user/weights*
dtype0*
_output_shapes
:
w
#save_1/RestoreV2_4/shape_and_slicesConst* 
valueBB2 1 0,2:0,1*
dtype0*
_output_shapes
:
д
save_1/RestoreV2_4	RestoreV2save_1/Constsave_1/RestoreV2_4/tensor_names#save_1/RestoreV2_4/shape_and_slices*
dtypes
2*
_output_shapes

:
Ї
save_1/Assign_4Assign/linear/linear_model/invalid_user/weights/part_0save_1/RestoreV2_4*
T0*
validate_shape(*
use_locking(*B
_class8
64loc:@linear/linear_model/invalid_user/weights/part_0*
_output_shapes

:
Ж
save_1/RestoreV2_5/tensor_namesConst*3
value*B(Blinear/linear_model/ip/weights*
dtype0*
_output_shapes
:
}
#save_1/RestoreV2_5/shape_and_slicesConst*&
valueBB5000 1 0,5000:0,1*
dtype0*
_output_shapes
:
е
save_1/RestoreV2_5	RestoreV2save_1/Constsave_1/RestoreV2_5/tensor_names#save_1/RestoreV2_5/shape_and_slices*
dtypes
2*
_output_shapes
:	И'
с
save_1/Assign_5Assign%linear/linear_model/ip/weights/part_0save_1/RestoreV2_5*
T0*
validate_shape(*
use_locking(*8
_class.
,*loc:@linear/linear_model/ip/weights/part_0*
_output_shapes
:	И'
М
save_1/RestoreV2_6/tensor_namesConst*9
value0B.B$linear/linear_model/provider/weights*
dtype0*
_output_shapes
:
}
#save_1/RestoreV2_6/shape_and_slicesConst*&
valueBB1000 1 0,1000:0,1*
dtype0*
_output_shapes
:
е
save_1/RestoreV2_6	RestoreV2save_1/Constsave_1/RestoreV2_6/tensor_names#save_1/RestoreV2_6/shape_and_slices*
dtypes
2*
_output_shapes
:	ш
э
save_1/Assign_6Assign+linear/linear_model/provider/weights/part_0save_1/RestoreV2_6*
T0*
validate_shape(*
use_locking(*>
_class4
20loc:@linear/linear_model/provider/weights/part_0*
_output_shapes
:	ш
Л
save_1/RestoreV2_7/tensor_namesConst*8
value/B-B#linear/linear_model/success/weights*
dtype0*
_output_shapes
:
w
#save_1/RestoreV2_7/shape_and_slicesConst* 
valueBB2 1 0,2:0,1*
dtype0*
_output_shapes
:
д
save_1/RestoreV2_7	RestoreV2save_1/Constsave_1/RestoreV2_7/tensor_names#save_1/RestoreV2_7/shape_and_slices*
dtypes
2*
_output_shapes

:
ъ
save_1/Assign_7Assign*linear/linear_model/success/weights/part_0save_1/RestoreV2_7*
T0*
validate_shape(*
use_locking(*=
_class3
1/loc:@linear/linear_model/success/weights/part_0*
_output_shapes

:
М
save_1/RestoreV2_8/tensor_namesConst*9
value0B.B$linear/linear_model/username/weights*
dtype0*
_output_shapes
:
}
#save_1/RestoreV2_8/shape_and_slicesConst*&
valueBB1000 1 0,1000:0,1*
dtype0*
_output_shapes
:
е
save_1/RestoreV2_8	RestoreV2save_1/Constsave_1/RestoreV2_8/tensor_names#save_1/RestoreV2_8/shape_and_slices*
dtypes
2*
_output_shapes
:	ш
э
save_1/Assign_8Assign+linear/linear_model/username/weights/part_0save_1/RestoreV2_8*
T0*
validate_shape(*
use_locking(*>
_class4
20loc:@linear/linear_model/username/weights/part_0*
_output_shapes
:	ш
╝
save_1/restore_shardNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_2^save_1/Assign_3^save_1/Assign_4^save_1/Assign_5^save_1/Assign_6^save_1/Assign_7^save_1/Assign_8
1
save_1/restore_allNoOp^save_1/restore_shard"B
save_1/Const:0save_1/Identity:0save_1/restore_all (5 @F8"╧
	variables┴╛
X
global_step:0global_step/Assignglobal_step/read:02global_step/Initializer/zeros:0
Ы
0linear/linear_model/auth_method/weights/part_0:05linear/linear_model/auth_method/weights/part_0/Assign5linear/linear_model/auth_method/weights/part_0/read:0"5
'linear/linear_model/auth_method/weights  "2Blinear/linear_model/auth_method/weights/part_0/Initializer/zeros:0
Й
,linear/linear_model/country/weights/part_0:01linear/linear_model/country/weights/part_0/Assign1linear/linear_model/country/weights/part_0/read:0"3
#linear/linear_model/country/weightsш  "ш2>linear/linear_model/country/weights/part_0/Initializer/zeros:0
а
1linear/linear_model/invalid_user/weights/part_0:06linear/linear_model/invalid_user/weights/part_0/Assign6linear/linear_model/invalid_user/weights/part_0/read:0"6
(linear/linear_model/invalid_user/weights  "2Clinear/linear_model/invalid_user/weights/part_0/Initializer/zeros:0
Ё
'linear/linear_model/ip/weights/part_0:0,linear/linear_model/ip/weights/part_0/Assign,linear/linear_model/ip/weights/part_0/read:0".
linear/linear_model/ip/weightsИ'  "И'29linear/linear_model/ip/weights/part_0/Initializer/zeros:0
О
-linear/linear_model/provider/weights/part_0:02linear/linear_model/provider/weights/part_0/Assign2linear/linear_model/provider/weights/part_0/read:0"4
$linear/linear_model/provider/weightsш  "ш2?linear/linear_model/provider/weights/part_0/Initializer/zeros:0
З
,linear/linear_model/success/weights/part_0:01linear/linear_model/success/weights/part_0/Assign1linear/linear_model/success/weights/part_0/read:0"1
#linear/linear_model/success/weights  "2>linear/linear_model/success/weights/part_0/Initializer/zeros:0
О
-linear/linear_model/username/weights/part_0:02linear/linear_model/username/weights/part_0/Assign2linear/linear_model/username/weights/part_0/read:0"4
$linear/linear_model/username/weightsш  "ш2?linear/linear_model/username/weights/part_0/Initializer/zeros:0
ї
)linear/linear_model/bias_weights/part_0:0.linear/linear_model/bias_weights/part_0/Assign.linear/linear_model/bias_weights/part_0/read:0"+
 linear/linear_model/bias_weights "2;linear/linear_model/bias_weights/part_0/Initializer/zeros:0" 
global_step

global_step:0"ё
table_initializer█
╪
Hlinear/linear_model/auth_method/auth_method_lookup/hash_table/table_init
Jlinear/linear_model/invalid_user/invalid_user_lookup/hash_table/table_init
@linear/linear_model/success/success_lookup/hash_table/table_init"√
model_variablesчф
Ы
0linear/linear_model/auth_method/weights/part_0:05linear/linear_model/auth_method/weights/part_0/Assign5linear/linear_model/auth_method/weights/part_0/read:0"5
'linear/linear_model/auth_method/weights  "2Blinear/linear_model/auth_method/weights/part_0/Initializer/zeros:0
Й
,linear/linear_model/country/weights/part_0:01linear/linear_model/country/weights/part_0/Assign1linear/linear_model/country/weights/part_0/read:0"3
#linear/linear_model/country/weightsш  "ш2>linear/linear_model/country/weights/part_0/Initializer/zeros:0
а
1linear/linear_model/invalid_user/weights/part_0:06linear/linear_model/invalid_user/weights/part_0/Assign6linear/linear_model/invalid_user/weights/part_0/read:0"6
(linear/linear_model/invalid_user/weights  "2Clinear/linear_model/invalid_user/weights/part_0/Initializer/zeros:0
Ё
'linear/linear_model/ip/weights/part_0:0,linear/linear_model/ip/weights/part_0/Assign,linear/linear_model/ip/weights/part_0/read:0".
linear/linear_model/ip/weightsИ'  "И'29linear/linear_model/ip/weights/part_0/Initializer/zeros:0
О
-linear/linear_model/provider/weights/part_0:02linear/linear_model/provider/weights/part_0/Assign2linear/linear_model/provider/weights/part_0/read:0"4
$linear/linear_model/provider/weightsш  "ш2?linear/linear_model/provider/weights/part_0/Initializer/zeros:0
З
,linear/linear_model/success/weights/part_0:01linear/linear_model/success/weights/part_0/Assign1linear/linear_model/success/weights/part_0/read:0"1
#linear/linear_model/success/weights  "2>linear/linear_model/success/weights/part_0/Initializer/zeros:0
О
-linear/linear_model/username/weights/part_0:02linear/linear_model/username/weights/part_0/Assign2linear/linear_model/username/weights/part_0/read:0"4
$linear/linear_model/username/weightsш  "ш2?linear/linear_model/username/weights/part_0/Initializer/zeros:0
ї
)linear/linear_model/bias_weights/part_0:0.linear/linear_model/bias_weights/part_0/Assign.linear/linear_model/bias_weights/part_0/read:0"+
 linear/linear_model/bias_weights "2;linear/linear_model/bias_weights/part_0/Initializer/zeros:0" 
trainable_variablesчф
Ы
0linear/linear_model/auth_method/weights/part_0:05linear/linear_model/auth_method/weights/part_0/Assign5linear/linear_model/auth_method/weights/part_0/read:0"5
'linear/linear_model/auth_method/weights  "2Blinear/linear_model/auth_method/weights/part_0/Initializer/zeros:0
Й
,linear/linear_model/country/weights/part_0:01linear/linear_model/country/weights/part_0/Assign1linear/linear_model/country/weights/part_0/read:0"3
#linear/linear_model/country/weightsш  "ш2>linear/linear_model/country/weights/part_0/Initializer/zeros:0
а
1linear/linear_model/invalid_user/weights/part_0:06linear/linear_model/invalid_user/weights/part_0/Assign6linear/linear_model/invalid_user/weights/part_0/read:0"6
(linear/linear_model/invalid_user/weights  "2Clinear/linear_model/invalid_user/weights/part_0/Initializer/zeros:0
Ё
'linear/linear_model/ip/weights/part_0:0,linear/linear_model/ip/weights/part_0/Assign,linear/linear_model/ip/weights/part_0/read:0".
linear/linear_model/ip/weightsИ'  "И'29linear/linear_model/ip/weights/part_0/Initializer/zeros:0
О
-linear/linear_model/provider/weights/part_0:02linear/linear_model/provider/weights/part_0/Assign2linear/linear_model/provider/weights/part_0/read:0"4
$linear/linear_model/provider/weightsш  "ш2?linear/linear_model/provider/weights/part_0/Initializer/zeros:0
З
,linear/linear_model/success/weights/part_0:01linear/linear_model/success/weights/part_0/Assign1linear/linear_model/success/weights/part_0/read:0"1
#linear/linear_model/success/weights  "2>linear/linear_model/success/weights/part_0/Initializer/zeros:0
О
-linear/linear_model/username/weights/part_0:02linear/linear_model/username/weights/part_0/Assign2linear/linear_model/username/weights/part_0/read:0"4
$linear/linear_model/username/weightsш  "ш2?linear/linear_model/username/weights/part_0/Initializer/zeros:0
ї
)linear/linear_model/bias_weights/part_0:0.linear/linear_model/bias_weights/part_0/Assign.linear/linear_model/bias_weights/part_0/read:0"+
 linear/linear_model/bias_weights "2;linear/linear_model/bias_weights/part_0/Initializer/zeros:0" 
legacy_init_op


group_deps*ц
serving_default╥
3
inputs)
input_example_tensor:0         4
classes)
linear/head/Tile:0         H
scores>
'linear/head/predictions/probabilities:0         tensorflow/serving/classify*х
classification╥
3
inputs)
input_example_tensor:0         4
classes)
linear/head/Tile:0         H
scores>
'linear/head/predictions/probabilities:0         tensorflow/serving/classify*ж

regressionЧ
3
inputs)
input_example_tensor:0         D
outputs9
"linear/head/predictions/logistic:0         tensorflow/serving/regress*╩
predict╛
5
examples)
input_example_tensor:0         A
logits7
 linear/head/predictions/logits:0         E
logistic9
"linear/head/predictions/logistic:0         O
probabilities>
'linear/head/predictions/probabilities:0         E
	class_ids8
!linear/head/predictions/classes:0	         G
classes<
%linear/head/predictions/str_classes:0         tensorflow/serving/predict