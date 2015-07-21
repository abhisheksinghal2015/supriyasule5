# We declare all of these here to type the first argument.

from __future__ import absolute_import

cimport cython
from .Scanning cimport PyrexScanner

ctypedef object (*p_sub_expr_func)(PyrexScanner obj)

# entry points

cpdef p_module(PyrexScanner s, pxd, full_module_name, ctx=*)
cpdef p_code(PyrexScanner s, level= *, ctx=*)

# internal parser states

cdef p_ident(PyrexScanner s, message =*)
cdef p_ident_list(PyrexScanner s)

cdef tuple p_binop_operator(PyrexScanner s)
cdef p_binop_expr(PyrexScanner s, ops, p_sub_expr_func p_sub_expr)
cdef p_lambdef(PyrexScanner s, bint allow_conditional=*)
cdef p_lambdef_nocond(PyrexScanner s)
cdef p_test(PyrexScanner s)
cdef p_test_nocond(PyrexScanner s)
cdef p_or_test(PyrexScanner s)
cdef p_rassoc_binop_expr(PyrexScanner s, ops, p_sub_expr_func p_subexpr)
cdef p_and_test(PyrexScanner s)
cdef p_not_test(PyrexScanner s)
cdef p_comparison(PyrexScanner s)
cdef p_test_or_starred_expr(PyrexScanner s)
cdef p_starred_expr(PyrexScanner s)
cdef p_cascaded_cmp(PyrexScanner s)
cdef p_cmp_op(PyrexScanner s)
cdef p_bit_expr(PyrexScanner s)
cdef p_xor_expr(PyrexScanner s)
cdef p_and_expr(PyrexScanner s)
cdef p_shift_expr(PyrexScanner s)
cdef p_arith_expr(PyrexScanner s)
cdef p_term(PyrexScanner s)
cdef p_factor(PyrexScanner s)
cdef _p_factor(PyrexScanner s)
cdef p_typecast(PyrexScanner s)
cdef p_sizeof(PyrexScanner s)
cdef p_yield_expression(PyrexScanner s)
cdef p_yield_statement(PyrexScanner s)
cdef p_power(PyrexScanner s)
cdef p_new_expr(PyrexScanner s)
cdef p_trailer(PyrexScanner s, node1)
cdef p_call_parse_args(PyrexScanner s, bint allow_genexp = *)
cdef p_call_build_packed_args(pos, positional_args, keyword_args, star_arg, starstar_arg)
cdef p_call(PyrexScanner s, function)
cdef p_index(PyrexScanner s, base)
cdef tuple p_subscript_list(PyrexScanner s)
cdef p_subscript(PyrexScanner s)
cdef p_slice_element(PyrexScanner s, follow_set)
cdef expect_ellipsis(PyrexScanner s)
cdef make_slice_nodes(pos, subscripts)
cpdef make_slice_node(pos, start, stop = *, step = *)
cdef p_atom(PyrexScanner s)
@cython.locals(value=unicode)
cdef p_int_literal(PyrexScanner s)
cdef p_name(PyrexScanner s, name)
cdef wrap_compile_time_constant(pos, value)
cdef p_cat_string_literal(PyrexScanner s)
cdef p_opt_string_literal(PyrexScanner s, required_type=*)
cdef bint check_for_non_ascii_characters(unicode string)
@cython.locals(systr=unicode, is_python3_source=bint, is_raw=bint)
cdef p_string_literal(PyrexScanner s, kind_override=*)
cdef p_list_maker(PyrexScanner s)
cdef p_comp_iter(PyrexScanner s, body)
cdef p_comp_for(PyrexScanner s, body)
cdef p_comp_if(PyrexScanner s, body)
cdef p_dict_or_set_maker(PyrexScanner s)
cdef p_backquote_expr(PyrexScanner s)
cdef p_simple_expr_list(PyrexScanner s, expr=*)
cdef p_test_or_starred_expr_list(PyrexScanner s, expr=*)
cdef p_testlist(PyrexScanner s)
cdef p_testlist_star_expr(PyrexScanner s)
cdef p_testlist_comp(PyrexScanner s)
cdef p_genexp(PyrexScanner s, expr)

#-------------------------------------------------------
#
#   Statements
#
#-------------------------------------------------------

cdef p_global_statement(PyrexScanner s)
cdef p_nonlocal_statement(PyrexScanner s)
cdef p_expression_or_assignment(PyrexScanner s)
cdef p_print_statement(PyrexScanner s)
cdef p_exec_statement(PyrexScanner s)
cdef p_del_statement(PyrexScanner s)
cdef p_pass_statement(PyrexScanner s, bint with_newline = *)
cdef p_break_statement(PyrexScanner s)
cdef p_continue_statement(PyrexScanner s)
cdef p_return_statement(PyrexScanner s)
cdef p_raise_statement(PyrexScanner s)
cdef p_import_statement(PyrexScanner s)
cdef p_from_import_statement(PyrexScanner s, bint first_statement = *)
cdef p_imported_name(PyrexScanner s, bint is_cimport)
cdef p_dotted_name(PyrexScanner s, bint as_allowed)
cdef p_as_name(PyrexScanner s)
cdef p_assert_statement(PyrexScanner s)
cdef p_if_statement(PyrexScanner s)
cdef p_if_clause(PyrexScanner s)
cdef p_else_clause(PyrexScanner s)
cdef p_while_statement(PyrexScanner s)
cdef p_for_statement(PyrexScanner s)
cdef dict p_for_bounds(PyrexScanner s, bint allow_testlist = *)
cdef p_for_from_relation(PyrexScanner s)
cdef p_for_from_step(PyrexScanner s)
cdef p_target(PyrexScanner s, terminator)
cdef p_for_target(PyrexScanner s)
cdef p_for_iterator(PyrexScanner s, bint allow_testlist = *)
cdef p_try_statement(PyrexScanner s)
cdef p_except_clause(PyrexScanner s)
cdef p_include_statement(PyrexScanner s, ctx)
cdef p_with_statement(PyrexScanner s)
cdef p_with_items(PyrexScanner s)
cdef p_with_template(PyrexScanner s)
cdef p_simple_statement(PyrexScanner s, bint first_statement = *)
cdef p_simple_statement_list(PyrexScanner s, ctx, bint first_statement = *)
cdef p_compile_time_expr(PyrexScanner s)
cdef p_DEF_statement(PyrexScanner s)
cdef p_IF_statement(PyrexScanner s, ctx)
cdef p_statement(PyrexScanner s, ctx, bint first_statement = *)
cdef p_statement_list(PyrexScanner s, ctx, bint first_statement = *)
cdef p_suite(PyrexScanner s, ctx = *)
cdef tuple p_suite_with_docstring(PyrexScanner s, ctx, with_doc_only = *)
cdef tuple _extract_docstring(node)
cdef p_positional_and_keyword_args(PyrexScanner s, end_sy_set, templates = *)

cpdef p_c_base_type(PyrexScanner s, bint self_flag = *, bint nonempty = *, templates = *)
cdef p_calling_convention(PyrexScanner s)
cdef p_c_complex_base_type(PyrexScanner s, templates = *)
cdef p_c_simple_base_type(PyrexScanner s, bint self_flag, bint nonempty, templates = *)
cdef p_buffer_or_template(PyrexScanner s, base_type_node, templates)
cdef p_bracketed_base_type(PyrexScanner s, base_type_node, nonempty, empty)
cdef is_memoryviewslice_access(PyrexScanner s)
cdef p_memoryviewslice_access(PyrexScanner s, base_type_node)
cdef bint looking_at_name(PyrexScanner s) except -2
cdef object looking_at_expr(PyrexScanner s)# except -2
cdef bint looking_at_base_type(PyrexScanner s) except -2
cdef bint looking_at_dotted_name(PyrexScanner s) except -2
cdef bint looking_at_call(PyrexScanner s) except -2
cdef p_sign_and_longness(PyrexScanner s)
cdef p_opt_cname(PyrexScanner s)
cpdef p_c_declarator(PyrexScanner s, ctx = *, bint empty = *, bint is_type = *, bint cmethod_flag = *,
                   bint assignable = *, bint nonempty = *,
                   bint calling_convention_allowed = *)
cdef p_c_array_declarator(PyrexScanner s, base)
cdef p_c_func_declarator(PyrexScanner s, pos, ctx, base, bint cmethod_flag)
cdef p_c_simple_declarator(PyrexScanner s, ctx, bint empty, bint is_type, bint cmethod_flag,
                          bint assignable, bint nonempty)
cdef p_nogil(PyrexScanner s)
cdef p_with_gil(PyrexScanner s)
cdef p_exception_value_clause(PyrexScanner s)
cpdef p_c_arg_list(PyrexScanner s, ctx = *, bint in_pyfunc = *, bint cmethod_flag = *,
                   bint nonempty_declarators = *, bint kw_only = *, bint annotated = *)
cdef p_optional_ellipsis(PyrexScanner s)
cdef p_c_arg_decl(PyrexScanner s, ctx, in_pyfunc, bint cmethod_flag = *, bint nonempty = *, bint kw_only = *, bint annotated = *)
cdef p_api(PyrexScanner s)
cdef p_cdef_statement(PyrexScanner s, ctx)
cdef p_cdef_block(PyrexScanner s, ctx)
cdef p_cdef_extern_block(PyrexScanner s, pos, ctx)
cdef p_c_enum_definition(PyrexScanner s, pos, ctx)
cdef p_c_enum_line(PyrexScanner s, ctx, list items)
cdef p_c_enum_item(PyrexScanner s, ctx, list items)
cdef p_c_struct_or_union_definition(PyrexScanner s, pos, ctx)
cdef p_fused_definition(PyrexScanner s, pos, ctx)
cdef p_struct_enum(PyrexScanner s, pos, ctx)
cdef p_visibility(PyrexScanner s, prev_visibility)
cdef p_c_modifiers(PyrexScanner s)
cdef p_c_func_or_var_declaration(PyrexScanner s, pos, ctx)
cdef p_ctypedef_statement(PyrexScanner s, ctx)
cdef p_decorators(PyrexScanner s)
cdef p_def_statement(PyrexScanner s, list decorators = *)
cdef p_varargslist(PyrexScanner s, terminator=*, bint annotated = *)
cdef p_py_arg_decl(PyrexScanner s, bint annotated = *)
cdef p_class_statement(PyrexScanner s, decorators)
cdef p_c_class_definition(PyrexScanner s, pos,  ctx)
cdef p_c_class_options(PyrexScanner s)
cdef p_property_decl(PyrexScanner s)
cdef p_doc_string(PyrexScanner s)
cdef p_ignorable_statement(PyrexScanner s)
cdef p_compiler_directive_comments(PyrexScanner s)
cdef p_cpp_class_definition(PyrexScanner s, pos, ctx)
cdef p_cpp_class_attribute(PyrexScanner s, ctx)