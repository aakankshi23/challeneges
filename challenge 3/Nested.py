
def get_nested_value(obj, key):
    """
    Get the value from a nested object using a key.

    Args:
        obj (dict): The nested object to search.
        key (str): The key to search for.

    Returns:
        The value corresponding to the given key, or None if the key is not found.
    """
    if key in obj:
        return obj[key]

    for k, v in obj.items():
        if isinstance(v, dict):
            result = get_nested_value(v, key)
            if result is not None:
                return result

    return None


nested_obj = {
    'd': 'e',
    'x': {
        'y': {
            'z': 'a'
        }
    }
}


# Get the value for the key 'd'
value = get_nested_value(nested_obj, 'd')
print(value)  # Output: 'e'

# Get the value for the key 'z'
value = get_nested_value(nested_obj, 'z')
print(value)  # Output: 'a'

# Try to get the value for a non-existent key
value = get_nested_value(nested_obj, 'nonexistent')
print(value)  # Output: None
