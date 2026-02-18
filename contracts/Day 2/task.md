# 1. Where are structs, mappings, and arrays stored?
They are stored either in storage, memory, or calldata.

If declared outside a function, they live in storage. Storage means the data is permanently saved on the blockchain.
If declared inside a function with memory, they are temporary.
Memory variables disappear after the function finishes executing. Mappings can only exist in storage, not in memory.
Arrays and structs can exist in both storage and memory.

# 2. How Structs, Mappings, and Arrays Behave When Executed or Called
When structs, mappings, and arrays are used in a function, their behavior depends on whether they are in storage or memory.

If they are in storage, they reference the original blockchain data. Any modification made to them updates the permanent state and costs gas. The changes remain even after the function finishes executing.

If they are declared in memory, they behave as temporary copies. Changes made to memory variables do not affect the original storage data. Once the function execution ends, memory data is automatically deleted.

Structs and arrays can behave either as references (when using storage) or as copies (when using memory). This affects whether changes impact the original data or not.

Mappings always behave as storage references because they cannot exist in memory. Therefore, any update to a mapping directly modifies the contract’s permanent state.

# Why don’t you need to specify memory or storage with mappings?

In Solidity, mappings can only exist in storage, meaning they are permanently stored on the blockchain. Unlike structs and arrays, Solidity does not allow mappings to be created in memory.

Because storage is the only possible location for mappings, the compiler automatically knows where they belong. There is no need to explicitly write storage when declaring them as state variables.

Mappings are implemented internally using a hashing mechanism, which allows values to be retrieved using a key. However, they do not actually store keys the way arrays store indexes.

Instead, they behave like a permanent key-value lookup table that exists on-chain. Since they must always live in storage, you don’t need to specify memory or storage when declaring them.


//Lecturer
Call data, what does it signify: It is like read only and they are immutable. You only use them with only function that is it must be external. but recent version 
they are immatable by nature,
And cant be changed

When you have your mapping, what is the purpose of your mapping, Trying to track data, there is something you want to do with the data and when ever the data is increased or decreased, if it is stored in memory.

two memory location: Memory or calldata

All your technology runs on web2

When and where we can use mappings and array
You have all the person properties and all of them have been pushed into an array,
What is your project structures. If your key will hold as many properties, You use an array and can