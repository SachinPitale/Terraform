lifecyle Meta-Argument block contains 3 arguments
1. create_before_destroy
2. prevent_destroy
3. ignore_changes


# lifecyle - create_before_destroy
    Default Behavior of a Resource: Destroy Resource & re-create Resource
    With Lifecycle Block we can change that using create_before_destroy=true
        First new resource will get created
        Second old resource will get destroyed

# Add Lifecycle Block inside Resource Block to alter behavior

# Lifecycle Block inside a Resource
    lifecycle {
        create_before_destroy = true
    }