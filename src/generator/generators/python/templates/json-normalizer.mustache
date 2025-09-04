from typing import Any, Dict, Set

JSONObject = Dict[str, Any]

def normalize_keys(input_data: Any) -> Any:
    """
    Normalize keys so that:
      - All objects with the same property name share the union of keys seen anywhere.
      - All objects inside the same array share the union of keys at that array level.
    Missing keys are filled with None.
    """
    templates_by_prop_name: Dict[str, Set[str]] = {}

    def collect_templates(node: Any) -> None:
        if isinstance(node, list):
            # Recurse into array items
            for item in node:
                collect_templates(item)
            return

        if isinstance(node, dict):
            # For each property: if it's a dict (non-list), record its keys under that property name
            for k, v in node.items():
                if isinstance(v, dict):
                    s = templates_by_prop_name.setdefault(k, set())
                    for child_key in v.keys():
                        s.add(child_key)
                # Recurse
                collect_templates(v)

    def apply_templates(node: Any) -> Any:
        if isinstance(node, list):
            # Compute union of keys across all dict elements for this array level
            array_union: Set[str] = set()
            for item in node:
                if isinstance(item, dict):
                    array_union.update(item.keys())

            normalized_list = []
            for item in node:
                if isinstance(item, dict):
                    # Ensure array-level union keys
                    next_obj: JSONObject = dict(item)
                    for k in array_union:
                        if k not in next_obj:
                            next_obj[k] = None

                    # Apply templates to nested dict properties
                    for k, v in list(next_obj.items()):
                        if isinstance(v, dict):
                            next_obj[k] = fill_from_template(k, v)
                        else:
                            next_obj[k] = apply_templates(v)
                    normalized_list.append(next_obj)
                else:
                    normalized_list.append(apply_templates(item))
            return normalized_list

        if isinstance(node, dict):
            out: JSONObject = {}
            for k, v in node.items():
                if isinstance(v, dict):
                    out[k] = fill_from_template(k, v)
                else:
                    out[k] = apply_templates(v)
            return out

        # primitives unchanged
        return node

    def fill_from_template(prop: str, obj: Any) -> Any:
        # Recurse first so nested arrays/objects also normalize
        base = apply_templates(obj)
        templ = templates_by_prop_name.get(prop)
        if not templ or not isinstance(base, dict):
            return base

        filled: JSONObject = dict(base)
        for key in templ:
            if key not in filled:
                filled[key] = None
        return filled

    # Run passes
    collect_templates(input_data)
    return apply_templates(input_data)
