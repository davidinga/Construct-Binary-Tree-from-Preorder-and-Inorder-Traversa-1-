/*
Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.
*/

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    guard preorder.count > 0, inorder.count > 0 else { return nil }
    let root = TreeNode(preorder[0])
    let midIdx = inorder.firstIndex(of: preorder[0])!
    root.left = buildTree(Array(preorder[1..<(midIdx+1)]), Array(inorder[..<midIdx]))
    root.right = buildTree(Array(preorder[(midIdx+1)...]), Array(inorder[(midIdx+1)...]))
    return root
}