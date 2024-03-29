<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile doxygen_version="1.9.4">
  <compound kind="class">
    <name>basic_streambuf</name>
    <filename>classbasic__streambuf.html</filename>
  </compound>
  <compound kind="class">
    <name>mask_based_range_hashing</name>
    <filename>classmask__based__range__hashing.html</filename>
  </compound>
  <compound kind="class">
    <name>mod_based_range_hashing</name>
    <filename>classmod__based__range__hashing.html</filename>
  </compound>
  <compound kind="struct">
    <name>sigc::adaptor_base</name>
    <filename>structsigc_1_1adaptor__base.html</filename>
  </compound>
  <compound kind="struct">
    <name>sigc::adaptor_functor</name>
    <filename>structsigc_1_1adaptor__functor.html</filename>
    <templarg>typename T_functor</templarg>
    <base>sigc::adaptor_base</base>
    <member kind="function">
      <type></type>
      <name>adaptor_functor</name>
      <anchorfile>structsigc_1_1adaptor__functor.html</anchorfile>
      <anchor>a35ecf04af30830154f9ced6ddb9401a7</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>adaptor_functor</name>
      <anchorfile>structsigc_1_1adaptor__functor.html</anchorfile>
      <anchor>ad8db5d07a3dc81f9771052611b1b0a3b</anchor>
      <arglist>(const T_functor &amp;functor)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>adaptor_functor</name>
      <anchorfile>structsigc_1_1adaptor__functor.html</anchorfile>
      <anchor>a8786a858388c7ab1074a7f5318f8c242</anchor>
      <arglist>(const T_type &amp;type)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>operator()</name>
      <anchorfile>structsigc_1_1adaptor__functor.html</anchorfile>
      <anchor>affdafa5b1938033b09e537874a966e1a</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>operator()</name>
      <anchorfile>structsigc_1_1adaptor__functor.html</anchorfile>
      <anchor>a0bf022c0122de2bec4da2a682696b6c6</anchor>
      <arglist>(T_arg &amp;&amp;... arg) const</arglist>
    </member>
    <member kind="variable">
      <type>T_functor</type>
      <name>functor_</name>
      <anchorfile>structsigc_1_1adaptor__functor.html</anchorfile>
      <anchor>a4faff6b7a82f4f6d92e3d3b0aa8fdca8</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::adaptor_trait</name>
    <filename>structsigc_1_1adaptor__trait.html</filename>
    <templarg>typename T_functor</templarg>
    <templarg>bool I_isadaptor</templarg>
  </compound>
  <compound kind="struct">
    <name>sigc::adaptor_trait&lt; T_functor, false &gt;</name>
    <filename>structsigc_1_1adaptor__trait_3_01T__functor_00_01false_01_4.html</filename>
    <templarg>typename T_functor</templarg>
    <member kind="typedef">
      <type>adaptor_functor&lt; functor_type &gt;</type>
      <name>adaptor_type</name>
      <anchorfile>structsigc_1_1adaptor__trait_3_01T__functor_00_01false_01_4.html</anchorfile>
      <anchor>af72713c96b82c5205ea4e884c9fd7565</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::adaptor_trait&lt; T_functor, true &gt;</name>
    <filename>structsigc_1_1adaptor__trait_3_01T__functor_00_01true_01_4.html</filename>
    <templarg>typename T_functor</templarg>
    <member kind="typedef">
      <type>T_functor</type>
      <name>adaptor_type</name>
      <anchorfile>structsigc_1_1adaptor__trait_3_01T__functor_00_01true_01_4.html</anchorfile>
      <anchor>a3a4dd88741539b2abd5931a732f9e1c3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::adapts</name>
    <filename>structsigc_1_1adapts.html</filename>
    <templarg>typename T_functor</templarg>
    <base>sigc::adaptor_base</base>
    <member kind="function">
      <type></type>
      <name>adapts</name>
      <anchorfile>structsigc_1_1adapts.html</anchorfile>
      <anchor>a90e81ef167e1c3959168570fc533d4a9</anchor>
      <arglist>(const T_functor &amp;functor)</arglist>
    </member>
    <member kind="variable">
      <type>adaptor_type</type>
      <name>functor_</name>
      <anchorfile>structsigc_1_1adapts.html</anchorfile>
      <anchor>a2f4b37eb160708baf17de57f2abce7a7</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::bind_functor</name>
    <filename>structsigc_1_1bind__functor.html</filename>
    <templarg>int I_location</templarg>
    <templarg>typename T_functor</templarg>
    <templarg>typename... T_bound</templarg>
    <base>sigc::adapts</base>
    <member kind="function">
      <type></type>
      <name>bind_functor</name>
      <anchorfile>structsigc_1_1bind__functor.html</anchorfile>
      <anchor>a030940f51fbed0c8f7846b91fd5a3e42</anchor>
      <arglist>(type_trait_take_t&lt; T_functor &gt; func, type_trait_take_t&lt; T_bound &gt;... bound)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>operator()</name>
      <anchorfile>structsigc_1_1bind__functor.html</anchorfile>
      <anchor>a13e894a73b569075aa51f8539964a852</anchor>
      <arglist>(T_arg &amp;&amp;... arg)</arglist>
    </member>
    <member kind="variable">
      <type>std::tuple&lt; bound_argument&lt; T_bound &gt;... &gt;</type>
      <name>bound_</name>
      <anchorfile>structsigc_1_1bind__functor.html</anchorfile>
      <anchor>a5cf18d66bb68dae634dafacea75de895</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::bind_functor&lt;-1, T_functor, T_type... &gt;</name>
    <filename>structsigc_1_1bind__functor_3-1_00_01T__functor_00_01T__type_8_8_8_01_4.html</filename>
    <templarg>typename T_functor</templarg>
    <templarg>typename... T_type</templarg>
    <base>sigc::adapts</base>
    <member kind="function">
      <type></type>
      <name>bind_functor</name>
      <anchorfile>structsigc_1_1bind__functor_3-1_00_01T__functor_00_01T__type_8_8_8_01_4.html</anchorfile>
      <anchor>ad52d6d2aa0ba4d5bd656a86a7219282a</anchor>
      <arglist>(type_trait_take_t&lt; T_functor &gt; func, type_trait_take_t&lt; T_type &gt;... bound)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>operator()</name>
      <anchorfile>structsigc_1_1bind__functor_3-1_00_01T__functor_00_01T__type_8_8_8_01_4.html</anchorfile>
      <anchor>abccc707a3c9e02908a7e953d1711616e</anchor>
      <arglist>(T_arg &amp;&amp;... arg)</arglist>
    </member>
    <member kind="variable">
      <type>std::tuple&lt; bound_argument&lt; T_type &gt;... &gt;</type>
      <name>bound_</name>
      <anchorfile>structsigc_1_1bind__functor_3-1_00_01T__functor_00_01T__type_8_8_8_01_4.html</anchorfile>
      <anchor>af74509b2385e3f03428e752d4e328ff6</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::bind_return_functor</name>
    <filename>structsigc_1_1bind__return__functor.html</filename>
    <templarg>typename T_return</templarg>
    <templarg>typename T_functor</templarg>
    <base>sigc::adapts</base>
    <member kind="function">
      <type></type>
      <name>bind_return_functor</name>
      <anchorfile>structsigc_1_1bind__return__functor.html</anchorfile>
      <anchor>a4766bf4d5f514915a900301dd4d15657</anchor>
      <arglist>(type_trait_take_t&lt; T_functor &gt; functor, type_trait_take_t&lt; T_return &gt; ret_value)</arglist>
    </member>
    <member kind="function">
      <type>unwrap_reference&lt; T_return &gt;::type</type>
      <name>operator()</name>
      <anchorfile>structsigc_1_1bind__return__functor.html</anchorfile>
      <anchor>a35959a6f4d5f6ddc83f603ee67d25981</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>unwrap_reference&lt; T_return &gt;::type</type>
      <name>operator()</name>
      <anchorfile>structsigc_1_1bind__return__functor.html</anchorfile>
      <anchor>ad2f5052340e646f9840ba8d6b0131b95</anchor>
      <arglist>(T_arg... a)</arglist>
    </member>
    <member kind="variable">
      <type>bound_argument&lt; T_return &gt;</type>
      <name>ret_value_</name>
      <anchorfile>structsigc_1_1bind__return__functor.html</anchorfile>
      <anchor>aa7b8287c19d98cec75a7e64a9464772e</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sigc::bound_argument</name>
    <filename>classsigc_1_1bound__argument.html</filename>
    <templarg>typename T_type</templarg>
    <member kind="function">
      <type></type>
      <name>bound_argument</name>
      <anchorfile>classsigc_1_1bound__argument.html</anchorfile>
      <anchor>a1b5875536eb85310466c87d397fcad2d</anchor>
      <arglist>(const T_type &amp;arg)</arglist>
    </member>
    <member kind="function">
      <type>T_type &amp;</type>
      <name>invoke</name>
      <anchorfile>classsigc_1_1bound__argument.html</anchorfile>
      <anchor>ac93dac5a6002282edbf974a9410daa27</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const T_type &amp;</type>
      <name>visit</name>
      <anchorfile>classsigc_1_1bound__argument.html</anchorfile>
      <anchor>a491f33af00692443cf41c8344493a8c3</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sigc::bound_argument&lt; std::reference_wrapper&lt; const T_wrapped &gt; &gt;</name>
    <filename>classsigc_1_1bound__argument_3_01std_1_1reference__wrapper_3_01const_01T__wrapped_01_4_01_4.html</filename>
    <templarg>typename T_wrapped</templarg>
    <member kind="function">
      <type></type>
      <name>bound_argument</name>
      <anchorfile>classsigc_1_1bound__argument_3_01std_1_1reference__wrapper_3_01const_01T__wrapped_01_4_01_4.html</anchorfile>
      <anchor>a4c36031606b1275757cdd803b4f227c7</anchor>
      <arglist>(const std::reference_wrapper&lt; const T_wrapped &gt; &amp;arg)</arglist>
    </member>
    <member kind="function">
      <type>const T_wrapped &amp;</type>
      <name>invoke</name>
      <anchorfile>classsigc_1_1bound__argument_3_01std_1_1reference__wrapper_3_01const_01T__wrapped_01_4_01_4.html</anchorfile>
      <anchor>a1b7b1f1756fdb0d75d3273eafd5ccbd8</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const limit_reference&lt; const T_wrapped &gt; &amp;</type>
      <name>visit</name>
      <anchorfile>classsigc_1_1bound__argument_3_01std_1_1reference__wrapper_3_01const_01T__wrapped_01_4_01_4.html</anchorfile>
      <anchor>a07c0357dda352fbcbeb9ab402d5939d7</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sigc::bound_argument&lt; std::reference_wrapper&lt; T_wrapped &gt; &gt;</name>
    <filename>classsigc_1_1bound__argument_3_01std_1_1reference__wrapper_3_01T__wrapped_01_4_01_4.html</filename>
    <templarg>typename T_wrapped</templarg>
    <member kind="function">
      <type></type>
      <name>bound_argument</name>
      <anchorfile>classsigc_1_1bound__argument_3_01std_1_1reference__wrapper_3_01T__wrapped_01_4_01_4.html</anchorfile>
      <anchor>a19da6c95faa889ab23a807f04b5ac8ab</anchor>
      <arglist>(const std::reference_wrapper&lt; T_wrapped &gt; &amp;arg)</arglist>
    </member>
    <member kind="function">
      <type>T_wrapped &amp;</type>
      <name>invoke</name>
      <anchorfile>classsigc_1_1bound__argument_3_01std_1_1reference__wrapper_3_01T__wrapped_01_4_01_4.html</anchorfile>
      <anchor>ab3b9e2490dbc57d897d386a9932664c0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const limit_reference&lt; T_wrapped &gt; &amp;</type>
      <name>visit</name>
      <anchorfile>classsigc_1_1bound__argument_3_01std_1_1reference__wrapper_3_01T__wrapped_01_4_01_4.html</anchorfile>
      <anchor>a4bf76f6edbfe02c4b8623f19b84b33eb</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sigc::bound_mem_functor</name>
    <filename>classsigc_1_1bound__mem__functor.html</filename>
    <templarg>typename T_func</templarg>
    <templarg>typename... T_arg</templarg>
    <base protection="private">mem_functor&lt; T_func, T_arg... &gt;</base>
    <member kind="typedef">
      <type>typename base_type::function_type</type>
      <name>function_type</name>
      <anchorfile>classsigc_1_1bound__mem__functor.html</anchorfile>
      <anchor>a872b1c05e93574f6b4fea719dd84562b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename std::conditional_t&lt; internal::member_method_is_const&lt; T_func &gt;::value, const object_type, object_type &gt;</type>
      <name>obj_type_with_modifier</name>
      <anchorfile>classsigc_1_1bound__mem__functor.html</anchorfile>
      <anchor>a69e38ae68878e27f3ce2583d1cdc9669</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename base_type::object_type</type>
      <name>object_type</name>
      <anchorfile>classsigc_1_1bound__mem__functor.html</anchorfile>
      <anchor>a6cff1d1d709688fed710b40ce96c6eca</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename std::conditional_t&lt; internal::member_method_is_const&lt; T_func &gt;::value, limit_reference&lt; const object_type &gt;, limit_reference&lt; object_type &gt; &gt;</type>
      <name>T_limit_reference</name>
      <anchorfile>classsigc_1_1bound__mem__functor.html</anchorfile>
      <anchor>a28c1968f18062134490f62f4113e1061</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>bound_mem_functor</name>
      <anchorfile>classsigc_1_1bound__mem__functor.html</anchorfile>
      <anchor>a8ef43e5d5455b43449b25410b0160860</anchor>
      <arglist>(obj_type_with_modifier &amp;obj, function_type func)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>operator()</name>
      <anchorfile>classsigc_1_1bound__mem__functor.html</anchorfile>
      <anchor>ad4711d042328e1da9fd57e22e2d23fda</anchor>
      <arglist>(type_trait_take_t&lt; T_arg &gt;... a) const</arglist>
    </member>
    <member kind="variable">
      <type>T_limit_reference</type>
      <name>obj_</name>
      <anchorfile>classsigc_1_1bound__mem__functor.html</anchorfile>
      <anchor>a634f14739f5639cbba81c0fec28303b3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::compose1_functor</name>
    <filename>structsigc_1_1compose1__functor.html</filename>
    <templarg>typename T_setter</templarg>
    <templarg>typename T_getter</templarg>
    <base>adapts&lt; T_setter &gt;</base>
    <member kind="function">
      <type></type>
      <name>compose1_functor</name>
      <anchorfile>structsigc_1_1compose1__functor.html</anchorfile>
      <anchor>ac28c1664262e854a531ab3d67f3ff31e</anchor>
      <arglist>(const T_setter &amp;setter, const T_getter &amp;getter)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>operator()</name>
      <anchorfile>structsigc_1_1compose1__functor.html</anchorfile>
      <anchor>ae7f62fc5d355e5e0d2e9e0213cfa6cfd</anchor>
      <arglist>(T_arg &amp;&amp;... a)</arglist>
    </member>
    <member kind="variable">
      <type>T_getter</type>
      <name>get_</name>
      <anchorfile>structsigc_1_1compose1__functor.html</anchorfile>
      <anchor>a447b480c13fd4789999068926b4168bc</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::compose2_functor</name>
    <filename>structsigc_1_1compose2__functor.html</filename>
    <templarg>typename T_setter</templarg>
    <templarg>typename T_getter1</templarg>
    <templarg>typename T_getter2</templarg>
    <base>adapts&lt; T_setter &gt;</base>
    <member kind="function">
      <type></type>
      <name>compose2_functor</name>
      <anchorfile>structsigc_1_1compose2__functor.html</anchorfile>
      <anchor>aca652fedefcce4cda4386a5f4a58d265</anchor>
      <arglist>(const T_setter &amp;setter, const T_getter1 &amp;getter1, const T_getter2 &amp;getter2)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>operator()</name>
      <anchorfile>structsigc_1_1compose2__functor.html</anchorfile>
      <anchor>a11c5aa999a262510a4ddcc930c267e3d</anchor>
      <arglist>(T_arg... a)</arglist>
    </member>
    <member kind="variable">
      <type>T_getter1</type>
      <name>get1_</name>
      <anchorfile>structsigc_1_1compose2__functor.html</anchorfile>
      <anchor>a8b0639151296048e9efbe890cf3079b5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>T_getter2</type>
      <name>get2_</name>
      <anchorfile>structsigc_1_1compose2__functor.html</anchorfile>
      <anchor>a513a25616d1d55be62b79ac857df05fe</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::connection</name>
    <filename>structsigc_1_1connection.html</filename>
    <member kind="function">
      <type></type>
      <name>connection</name>
      <anchorfile>structsigc_1_1connection.html</anchorfile>
      <anchor>a95f80dbbf10fde0b851d78ec12cc2629</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>connection</name>
      <anchorfile>structsigc_1_1connection.html</anchorfile>
      <anchor>ad13d5e3331cc9b1494e0edb8fa37fdba</anchor>
      <arglist>(const connection &amp;c)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>connection</name>
      <anchorfile>structsigc_1_1connection.html</anchorfile>
      <anchor>ac0424dbcb9db4176338fd38012c9975e</anchor>
      <arglist>(slot_base &amp;slot)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~connection</name>
      <anchorfile>structsigc_1_1connection.html</anchorfile>
      <anchor>a99678ccb2be5c20719f37e469416578a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>block</name>
      <anchorfile>structsigc_1_1connection.html</anchorfile>
      <anchor>a581ae4f2b708cb6be7b081557864d6ec</anchor>
      <arglist>(bool should_block=true) noexcept</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>blocked</name>
      <anchorfile>structsigc_1_1connection.html</anchorfile>
      <anchor>a7c86964aa4b0f339db5842e6c7e604f3</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>connected</name>
      <anchorfile>structsigc_1_1connection.html</anchorfile>
      <anchor>a307b5df56439539be66f92d6e39f0bce</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>disconnect</name>
      <anchorfile>structsigc_1_1connection.html</anchorfile>
      <anchor>a0452bd182a61650d14a9664d6297ed1b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>empty</name>
      <anchorfile>structsigc_1_1connection.html</anchorfile>
      <anchor>a810bdde9fbe7ad10bf9d578eebf929de</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>operator bool</name>
      <anchorfile>structsigc_1_1connection.html</anchorfile>
      <anchor>a5419e6fc689df523283e0182189c33b0</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>connection &amp;</type>
      <name>operator=</name>
      <anchorfile>structsigc_1_1connection.html</anchorfile>
      <anchor>ac348094a8aa4d8c09cb8f9ef9d381a91</anchor>
      <arglist>(const connection &amp;src)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>unblock</name>
      <anchorfile>structsigc_1_1connection.html</anchorfile>
      <anchor>a15abcbfa76f1e5d8601cf4ad4176ed50</anchor>
      <arglist>() noexcept</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::exception_catch_functor</name>
    <filename>structsigc_1_1exception__catch__functor.html</filename>
    <templarg>typename T_functor</templarg>
    <templarg>typename T_catcher</templarg>
    <base>sigc::adapts</base>
    <member kind="function">
      <type></type>
      <name>exception_catch_functor</name>
      <anchorfile>structsigc_1_1exception__catch__functor.html</anchorfile>
      <anchor>a8d1d3bd860ba6c8bba9ae7655f4dc3a5</anchor>
      <arglist>(const T_functor &amp;func, const T_catcher &amp;catcher)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>operator()</name>
      <anchorfile>structsigc_1_1exception__catch__functor.html</anchorfile>
      <anchor>aa7d768aae8b73b5853c8f223f3eeef7f</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>operator()</name>
      <anchorfile>structsigc_1_1exception__catch__functor.html</anchorfile>
      <anchor>a5784f84ee16758b747e77b89667bbee6</anchor>
      <arglist>(T_arg... a)</arglist>
    </member>
    <member kind="variable">
      <type>T_catcher</type>
      <name>catcher_</name>
      <anchorfile>structsigc_1_1exception__catch__functor.html</anchorfile>
      <anchor>a1bfd8dc4fc7a17006013d646be3cec1f</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::functor_trait</name>
    <filename>structsigc_1_1functor__trait.html</filename>
    <templarg>typename T_functor</templarg>
    <member kind="typedef">
      <type>T_functor</type>
      <name>functor_type</name>
      <anchorfile>structsigc_1_1functor__trait.html</anchorfile>
      <anchor>a47582113a4fbc3f2cd8c6336f8fe9b67</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::hide_functor</name>
    <filename>structsigc_1_1hide__functor.html</filename>
    <templarg>int I_location</templarg>
    <templarg>typename T_functor</templarg>
    <base>sigc::adapts</base>
    <member kind="function">
      <type></type>
      <name>hide_functor</name>
      <anchorfile>structsigc_1_1hide__functor.html</anchorfile>
      <anchor>abb0ddd2f5468fb2ead8e1d52c181ebca</anchor>
      <arglist>(const T_functor &amp;func)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>operator()</name>
      <anchorfile>structsigc_1_1hide__functor.html</anchorfile>
      <anchor>aa3bfa2b74af5a8fdd924bff73688bad5</anchor>
      <arglist>(T_arg &amp;&amp;... a)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sigc::limit_reference</name>
    <filename>classsigc_1_1limit__reference.html</filename>
    <templarg>typename T_type</templarg>
    <templarg>bool I_derives_trackable</templarg>
    <member kind="typedef">
      <type>typename std::remove_volatile_t&lt; T_type &gt;</type>
      <name>reference_type</name>
      <anchorfile>classsigc_1_1limit__reference.html</anchorfile>
      <anchor>a1092df7238eb5703afa2fabfbf3cf3a9</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>limit_reference</name>
      <anchorfile>classsigc_1_1limit__reference.html</anchorfile>
      <anchor>a64608a32d7fe0b2c39db77014bd5da9f</anchor>
      <arglist>()=delete</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>limit_reference</name>
      <anchorfile>classsigc_1_1limit__reference.html</anchorfile>
      <anchor>a1588506f63d9144b177d2ad561a59e3a</anchor>
      <arglist>(const limit_reference &amp;src)=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>limit_reference</name>
      <anchorfile>classsigc_1_1limit__reference.html</anchorfile>
      <anchor>a466ec9bf43c2bc3c6de3333378c810df</anchor>
      <arglist>(limit_reference &amp;&amp;src)=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>limit_reference</name>
      <anchorfile>classsigc_1_1limit__reference.html</anchorfile>
      <anchor>adbc26d25545ff546ee8361e0846d2c37</anchor>
      <arglist>(reference_type &amp;target)</arglist>
    </member>
    <member kind="function">
      <type>T_type &amp;</type>
      <name>invoke</name>
      <anchorfile>classsigc_1_1limit__reference.html</anchorfile>
      <anchor>abc32490b6778d62878654d459b9a2042</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>limit_reference &amp;</type>
      <name>operator=</name>
      <anchorfile>classsigc_1_1limit__reference.html</anchorfile>
      <anchor>a1afca6edd8fbab063d3d5381086db44b</anchor>
      <arglist>(const limit_reference &amp;src)=default</arglist>
    </member>
    <member kind="function">
      <type>limit_reference &amp;</type>
      <name>operator=</name>
      <anchorfile>classsigc_1_1limit__reference.html</anchorfile>
      <anchor>a32d44933cc3198fc0926f423cec2a5bd</anchor>
      <arglist>(limit_reference &amp;&amp;src)=default</arglist>
    </member>
    <member kind="function">
      <type>const reference_type &amp;</type>
      <name>visit</name>
      <anchorfile>classsigc_1_1limit__reference.html</anchorfile>
      <anchor>a4fb82b81773f9b98dba43b7a9052cdb2</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sigc::limit_reference&lt; T_type, true &gt;</name>
    <filename>classsigc_1_1limit__reference_3_01T__type_00_01true_01_4.html</filename>
    <templarg>typename T_type</templarg>
    <member kind="typedef">
      <type>typename std::remove_volatile_t&lt; T_type &gt;</type>
      <name>reference_type</name>
      <anchorfile>classsigc_1_1limit__reference_3_01T__type_00_01true_01_4.html</anchorfile>
      <anchor>aae9d2692328f83a89ff8d78978a12ce9</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>limit_reference</name>
      <anchorfile>classsigc_1_1limit__reference_3_01T__type_00_01true_01_4.html</anchorfile>
      <anchor>a2a98a2124761cb6d13122f2cadd7d7a2</anchor>
      <arglist>(reference_type &amp;target)</arglist>
    </member>
    <member kind="function">
      <type>T_type &amp;</type>
      <name>invoke</name>
      <anchorfile>classsigc_1_1limit__reference_3_01T__type_00_01true_01_4.html</anchorfile>
      <anchor>a09a78b73059d74420a0fc1784ee1e323</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const trackable &amp;</type>
      <name>visit</name>
      <anchorfile>classsigc_1_1limit__reference_3_01T__type_00_01true_01_4.html</anchorfile>
      <anchor>a0c718830147ca51ff4f19dab99c8ed81</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sigc::mem_functor</name>
    <filename>classsigc_1_1mem__functor.html</filename>
    <templarg>typename T_func</templarg>
    <templarg>typename... T_arg</templarg>
    <member kind="typedef">
      <type>T_func</type>
      <name>function_type</name>
      <anchorfile>classsigc_1_1mem__functor.html</anchorfile>
      <anchor>a15a8ea02f1ffc3875b06fe24afe0c716</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename std::conditional_t&lt; internal::member_method_is_const&lt; T_func &gt;::value, const object_type, object_type &gt;</type>
      <name>obj_type_with_modifier</name>
      <anchorfile>classsigc_1_1mem__functor.html</anchorfile>
      <anchor>a3364e8cdbb75b5339e860ed2e6c2e064</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename internal::member_method_class&lt; T_func &gt;::type</type>
      <name>object_type</name>
      <anchorfile>classsigc_1_1mem__functor.html</anchorfile>
      <anchor>a66ce968499f60275c30feea623a5fa5b</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>mem_functor</name>
      <anchorfile>classsigc_1_1mem__functor.html</anchorfile>
      <anchor>a47fa96e26ce1f3f4fd056342b76f90f6</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>mem_functor</name>
      <anchorfile>classsigc_1_1mem__functor.html</anchorfile>
      <anchor>af27b8235ab3a86911a6ba455ea18bbb7</anchor>
      <arglist>(function_type func)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>operator()</name>
      <anchorfile>classsigc_1_1mem__functor.html</anchorfile>
      <anchor>a37a7637a3d1589940f8b17f8a09180a0</anchor>
      <arglist>(obj_type_with_modifier &amp;obj, type_trait_take_t&lt; T_arg &gt;... a) const</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>function_type</type>
      <name>func_ptr_</name>
      <anchorfile>classsigc_1_1mem__functor.html</anchorfile>
      <anchor>a75b40e00180b77299d667feb0573c96d</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::notifiable</name>
    <filename>structsigc_1_1notifiable.html</filename>
    <member kind="typedef">
      <type>internal::func_destroy_notify</type>
      <name>func_destroy_notify</name>
      <anchorfile>structsigc_1_1notifiable.html</anchorfile>
      <anchor>a71455cae4b10ff1277e68a1729e1b8c4</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sigc::pointer_functor</name>
    <filename>classsigc_1_1pointer__functor.html</filename>
    <templarg>typename T_return</templarg>
    <templarg>typename... T_args</templarg>
  </compound>
  <compound kind="class">
    <name>sigc::pointer_functor&lt; T_return(T_args...)&gt;</name>
    <filename>classsigc_1_1pointer__functor_3_01T__return_07T__args_8_8_8_08_4.html</filename>
    <templarg>typename T_return</templarg>
    <templarg>typename... T_args</templarg>
    <member kind="function">
      <type></type>
      <name>pointer_functor</name>
      <anchorfile>classsigc_1_1pointer__functor_3_01T__return_07T__args_8_8_8_08_4.html</anchorfile>
      <anchor>a8c24759c975f2c4e7c18913f1adad397</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>pointer_functor</name>
      <anchorfile>classsigc_1_1pointer__functor_3_01T__return_07T__args_8_8_8_08_4.html</anchorfile>
      <anchor>a1abbaa91a159909420c06e93d7917bf6</anchor>
      <arglist>(function_type func)</arglist>
    </member>
    <member kind="function">
      <type>T_return</type>
      <name>operator()</name>
      <anchorfile>classsigc_1_1pointer__functor_3_01T__return_07T__args_8_8_8_08_4.html</anchorfile>
      <anchor>a1735eb14ed8a5810e6c78f6d478362a8</anchor>
      <arglist>(type_trait_take_t&lt; T_args &gt;... a) const</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>function_type</type>
      <name>func_ptr_</name>
      <anchorfile>classsigc_1_1pointer__functor_3_01T__return_07T__args_8_8_8_08_4.html</anchorfile>
      <anchor>a986042bfa4905a2cb5bf9d17a2f5a110</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::retype_functor</name>
    <filename>structsigc_1_1retype__functor.html</filename>
    <templarg>typename T_functor</templarg>
    <templarg>typename... T_type</templarg>
    <base>sigc::adapts</base>
    <member kind="function">
      <type></type>
      <name>retype_functor</name>
      <anchorfile>structsigc_1_1retype__functor.html</anchorfile>
      <anchor>ae1c611a409fc0d20e35a6148ec9bae41</anchor>
      <arglist>(type_trait_take_t&lt; T_functor &gt; functor)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>operator()</name>
      <anchorfile>structsigc_1_1retype__functor.html</anchorfile>
      <anchor>ac825c5137ffe05b0113662f09664f2f3</anchor>
      <arglist>(T_arg... a)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::retype_return_functor</name>
    <filename>structsigc_1_1retype__return__functor.html</filename>
    <templarg>typename T_return</templarg>
    <templarg>typename T_functor</templarg>
    <base>sigc::adapts</base>
    <member kind="function">
      <type></type>
      <name>retype_return_functor</name>
      <anchorfile>structsigc_1_1retype__return__functor.html</anchorfile>
      <anchor>a59293dcbd669f21528d027d89b205a9b</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>retype_return_functor</name>
      <anchorfile>structsigc_1_1retype__return__functor.html</anchorfile>
      <anchor>a54640478f5193a7719952f1514f52e9b</anchor>
      <arglist>(type_trait_take_t&lt; T_functor &gt; functor)</arglist>
    </member>
    <member kind="function">
      <type>T_return</type>
      <name>operator()</name>
      <anchorfile>structsigc_1_1retype__return__functor.html</anchorfile>
      <anchor>a5a8351fd4c16e3ff1407d3984ecda491</anchor>
      <arglist>(T_arg &amp;&amp;... a)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::retype_return_functor&lt; void, T_functor &gt;</name>
    <filename>structsigc_1_1retype__return__functor_3_01void_00_01T__functor_01_4.html</filename>
    <templarg>typename T_functor</templarg>
    <base>sigc::adapts</base>
    <member kind="function">
      <type></type>
      <name>retype_return_functor</name>
      <anchorfile>structsigc_1_1retype__return__functor_3_01void_00_01T__functor_01_4.html</anchorfile>
      <anchor>a541afde21dab200b4461e6d5f2955665</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>retype_return_functor</name>
      <anchorfile>structsigc_1_1retype__return__functor_3_01void_00_01T__functor_01_4.html</anchorfile>
      <anchor>a2d6d7497091664389bd5afe65770ffd8</anchor>
      <arglist>(type_trait_take_t&lt; T_functor &gt; functor)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>structsigc_1_1retype__return__functor_3_01void_00_01T__functor_01_4.html</anchorfile>
      <anchor>a764e42bd2c705cce6ef7fbe67d4b18ec</anchor>
      <arglist>(T_arg... a)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::scoped_connection</name>
    <filename>structsigc_1_1scoped__connection.html</filename>
    <member kind="function">
      <type></type>
      <name>scoped_connection</name>
      <anchorfile>structsigc_1_1scoped__connection.html</anchorfile>
      <anchor>a379e3f63314fa5e0ae46acaa06a8c73e</anchor>
      <arglist>() noexcept=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>scoped_connection</name>
      <anchorfile>structsigc_1_1scoped__connection.html</anchorfile>
      <anchor>abb7aa765a8120231883123ace3dad2c3</anchor>
      <arglist>(connection c) noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>scoped_connection</name>
      <anchorfile>structsigc_1_1scoped__connection.html</anchorfile>
      <anchor>ab462abef5cd92d1e83f5c82279d3083e</anchor>
      <arglist>(const scoped_connection &amp;)=delete</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>scoped_connection</name>
      <anchorfile>structsigc_1_1scoped__connection.html</anchorfile>
      <anchor>af7d522b789d5954aef621878428ab7a6</anchor>
      <arglist>(scoped_connection &amp;&amp;sc) noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~scoped_connection</name>
      <anchorfile>structsigc_1_1scoped__connection.html</anchorfile>
      <anchor>a33f7a91f7726fec5585c1892f7c5934d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>block</name>
      <anchorfile>structsigc_1_1scoped__connection.html</anchorfile>
      <anchor>ac3e3fdc43d7fd610e8d031ccc744ca4e</anchor>
      <arglist>(bool should_block=true) noexcept</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>blocked</name>
      <anchorfile>structsigc_1_1scoped__connection.html</anchorfile>
      <anchor>a09abcdaf76f0505b8edbc3d8859bf448</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>connected</name>
      <anchorfile>structsigc_1_1scoped__connection.html</anchorfile>
      <anchor>a04e64ea95fa04c058a97249bd39a1f08</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>disconnect</name>
      <anchorfile>structsigc_1_1scoped__connection.html</anchorfile>
      <anchor>ac0e8e220d3765b9c8715a4a16b79821d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>empty</name>
      <anchorfile>structsigc_1_1scoped__connection.html</anchorfile>
      <anchor>a882c244005c7346a8f1f117af8362e9b</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>operator bool</name>
      <anchorfile>structsigc_1_1scoped__connection.html</anchorfile>
      <anchor>a59db6e2ccc26d5d1a663677e124532d5</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>scoped_connection &amp;</type>
      <name>operator=</name>
      <anchorfile>structsigc_1_1scoped__connection.html</anchorfile>
      <anchor>ad97cab111c3c5b78bf07edbb8309954c</anchor>
      <arglist>(connection c)</arglist>
    </member>
    <member kind="function">
      <type>scoped_connection &amp;</type>
      <name>operator=</name>
      <anchorfile>structsigc_1_1scoped__connection.html</anchorfile>
      <anchor>a9345d8314fff939cc6a46cff3d869c8e</anchor>
      <arglist>(const scoped_connection &amp;)=delete</arglist>
    </member>
    <member kind="function">
      <type>scoped_connection &amp;</type>
      <name>operator=</name>
      <anchorfile>structsigc_1_1scoped__connection.html</anchorfile>
      <anchor>a437253c31c51a6140cd72fe24a1e719c</anchor>
      <arglist>(scoped_connection &amp;&amp;sc)</arglist>
    </member>
    <member kind="function">
      <type>connection</type>
      <name>release</name>
      <anchorfile>structsigc_1_1scoped__connection.html</anchorfile>
      <anchor>a9f5674dea206d6b98cd801f087cf66e4</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>unblock</name>
      <anchorfile>structsigc_1_1scoped__connection.html</anchorfile>
      <anchor>a13a6aa47d14862091e71ca4da3ceb8b7</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="friend">
      <type>friend void</type>
      <name>swap</name>
      <anchorfile>structsigc_1_1scoped__connection.html</anchorfile>
      <anchor>a9b77cc7210705977248ef9129cc7fd96</anchor>
      <arglist>(scoped_connection &amp;sca, scoped_connection &amp;scb) noexcept</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sigc::signal&lt; T_return(T_arg...)&gt;</name>
    <filename>classsigc_1_1signal_3_01T__return_07T__arg_8_8_8_08_4.html</filename>
    <templarg>typename T_return</templarg>
    <templarg>typename... T_arg</templarg>
    <base>signal_with_accumulator&lt; T_return, void, T_arg... &gt;</base>
    <class kind="class">sigc::signal&lt; T_return(T_arg...)&gt;::accumulated</class>
    <member kind="typedef">
      <type>void</type>
      <name>accumulator_type</name>
      <anchorfile>classsigc_1_1signal_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>a80332f4caf87e55c1038365318dacb60</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>signal</name>
      <anchorfile>classsigc_1_1signal_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>a64007f14e856dfc6fd775b0d7590b830</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>signal</name>
      <anchorfile>classsigc_1_1signal_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>aeb519c37f7e815bd98bab97fff31eb3a</anchor>
      <arglist>(const signal &amp;src)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>signal</name>
      <anchorfile>classsigc_1_1signal_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>ab5cc052ce9315f1ebb8f11a4ebd20c14</anchor>
      <arglist>(signal &amp;&amp;src)</arglist>
    </member>
    <member kind="function">
      <type>signal &amp;</type>
      <name>operator=</name>
      <anchorfile>classsigc_1_1signal_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>a2219e50ef29e525a03d2ba5ec67d7078</anchor>
      <arglist>(const signal &amp;src)</arglist>
    </member>
    <member kind="function">
      <type>signal &amp;</type>
      <name>operator=</name>
      <anchorfile>classsigc_1_1signal_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>aa13d4bf9ba4c2566e9d7097bd68a7ca8</anchor>
      <arglist>(signal &amp;&amp;src)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sigc::signal&lt; T_return(T_arg...)&gt;::accumulated</name>
    <filename>classsigc_1_1signal_3_01T__return_07T__arg_8_8_8_08_4_1_1accumulated.html</filename>
    <templarg>typename T_accumulator</templarg>
    <base>signal_with_accumulator&lt; T_return, T_accumulator, T_arg... &gt;</base>
    <member kind="function">
      <type></type>
      <name>accumulated</name>
      <anchorfile>classsigc_1_1signal_3_01T__return_07T__arg_8_8_8_08_4_1_1accumulated.html</anchorfile>
      <anchor>a082c6d8d61fb29a411b6ee457c4cfb26</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>accumulated</name>
      <anchorfile>classsigc_1_1signal_3_01T__return_07T__arg_8_8_8_08_4_1_1accumulated.html</anchorfile>
      <anchor>ae2a536f43414691cf7a11ca8eb8b8ca4</anchor>
      <arglist>(const accumulated &amp;src)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::signal_base</name>
    <filename>structsigc_1_1signal__base.html</filename>
    <member kind="typedef">
      <type>std::size_t</type>
      <name>size_type</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>a703c48e69c62ef57801e4d29f84f6e94</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>signal_base</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>aff65198ddcb4fbccb644ff853e663e0e</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>signal_base</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>a761e95b8c7b460664d3338ed3eb39543</anchor>
      <arglist>(const signal_base &amp;src) noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>signal_base</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>a9f8570c89cd5c0b35613570a5ea80154</anchor>
      <arglist>(signal_base &amp;&amp;src)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~signal_base</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>afa2e5807537c989b430015e5ae05a357</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>block</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>a52fda4806ec9dbc02baa95ce70c13fb0</anchor>
      <arglist>(bool should_block=true) noexcept</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>blocked</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>a228da4dd1eac6905dafbc5697086e503</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>clear</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>a17597d66e680d222248c523985f0afd6</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>empty</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>a24e7fc4e07ac19cebafe8e3bd71bfe94</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>signal_base &amp;</type>
      <name>operator=</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>a619e3f0f2b09946bc8b4b842bcd20b96</anchor>
      <arglist>(const signal_base &amp;src)</arglist>
    </member>
    <member kind="function">
      <type>signal_base &amp;</type>
      <name>operator=</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>a25f18727fa8e21611afd67757ebaec2f</anchor>
      <arglist>(signal_base &amp;&amp;src)</arglist>
    </member>
    <member kind="function">
      <type>size_type</type>
      <name>size</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>a0725416f747d6db3c57fa318a9f887a8</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>unblock</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>aebb7ac69ea745cd60c0505f8d553d27f</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="typedef" protection="protected">
      <type>internal::signal_impl::iterator_type</type>
      <name>iterator_type</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>ac3670b4b1b36db33ebeda3fe46532f85</anchor>
      <arglist></arglist>
    </member>
    <member kind="function" protection="protected">
      <type>iterator_type</type>
      <name>connect</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>a5c89a76a27d69c512f554b841b1bd08a</anchor>
      <arglist>(const slot_base &amp;slot_)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>iterator_type</type>
      <name>connect</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>a50eab6d37728bbbf3beb21d684a72e6c</anchor>
      <arglist>(slot_base &amp;&amp;slot_)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>iterator_type</type>
      <name>connect_first</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>a32f42943938ab44aa315bd4fc9089369</anchor>
      <arglist>(const slot_base &amp;slot_)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>iterator_type</type>
      <name>connect_first</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>ab55bfb2b01c04609b70d0423eb4bd6e3</anchor>
      <arglist>(slot_base &amp;&amp;slot_)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>std::shared_ptr&lt; internal::signal_impl &gt;</type>
      <name>impl</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>acdf351b73666997a1948688717ee3f1a</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>iterator_type</type>
      <name>insert</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>a87da23ad801faa9e2b6b4be2a747e757</anchor>
      <arglist>(iterator_type i, const slot_base &amp;slot_)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>iterator_type</type>
      <name>insert</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>aa80c33868910139dd2f511afcc31b687</anchor>
      <arglist>(iterator_type i, slot_base &amp;&amp;slot_)</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; internal::signal_impl &gt;</type>
      <name>impl_</name>
      <anchorfile>structsigc_1_1signal__base.html</anchorfile>
      <anchor>a47f7def7de72a42c0ab55ec0a5e4f203</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sigc::signal_with_accumulator</name>
    <filename>classsigc_1_1signal__with__accumulator.html</filename>
    <templarg>typename T_return</templarg>
    <templarg>typename T_accumulator</templarg>
    <templarg>typename... T_arg</templarg>
    <base>sigc::signal_base</base>
    <member kind="typedef">
      <type>slot&lt; T_return(T_arg...)&gt;</type>
      <name>slot_type</name>
      <anchorfile>classsigc_1_1signal__with__accumulator.html</anchorfile>
      <anchor>a2eee90cba16be957a3212d1b541ddc04</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>signal_with_accumulator</name>
      <anchorfile>classsigc_1_1signal__with__accumulator.html</anchorfile>
      <anchor>a3a3897c85039df0bdfb3badcf0123674</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>signal_with_accumulator</name>
      <anchorfile>classsigc_1_1signal__with__accumulator.html</anchorfile>
      <anchor>a33d243a0841a085e3d2fddc7723de5ce</anchor>
      <arglist>(const signal_with_accumulator &amp;src)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>signal_with_accumulator</name>
      <anchorfile>classsigc_1_1signal__with__accumulator.html</anchorfile>
      <anchor>a3a86b1a92c39a2f82f0c568243894462</anchor>
      <arglist>(signal_with_accumulator &amp;&amp;src)</arglist>
    </member>
    <member kind="function">
      <type>connection</type>
      <name>connect</name>
      <anchorfile>classsigc_1_1signal__with__accumulator.html</anchorfile>
      <anchor>a3765ae85a8ffaae0d48afa15fffe6009</anchor>
      <arglist>(const slot_type &amp;slot_)</arglist>
    </member>
    <member kind="function">
      <type>connection</type>
      <name>connect</name>
      <anchorfile>classsigc_1_1signal__with__accumulator.html</anchorfile>
      <anchor>adfad79b62b1a72bbb74bf329d84732a4</anchor>
      <arglist>(slot_type &amp;&amp;slot_)</arglist>
    </member>
    <member kind="function">
      <type>connection</type>
      <name>connect_first</name>
      <anchorfile>classsigc_1_1signal__with__accumulator.html</anchorfile>
      <anchor>a6887c2139445ff606c2cd0822ac81917</anchor>
      <arglist>(const slot_type &amp;slot_)</arglist>
    </member>
    <member kind="function">
      <type>connection</type>
      <name>connect_first</name>
      <anchorfile>classsigc_1_1signal__with__accumulator.html</anchorfile>
      <anchor>a1f4d1de24420560531202d0c509e6d5e</anchor>
      <arglist>(slot_type &amp;&amp;slot_)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>emit</name>
      <anchorfile>classsigc_1_1signal__with__accumulator.html</anchorfile>
      <anchor>a9cdd5ffe58f2445a1012c7be05f7029f</anchor>
      <arglist>(type_trait_take_t&lt; T_arg &gt;... a) const</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>make_slot</name>
      <anchorfile>classsigc_1_1signal__with__accumulator.html</anchorfile>
      <anchor>a6c35faed011b8497e2433fca322976ea</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>operator()</name>
      <anchorfile>classsigc_1_1signal__with__accumulator.html</anchorfile>
      <anchor>aa87c95f2e865abb8b3fe999fd9d5205c</anchor>
      <arglist>(type_trait_take_t&lt; T_arg &gt;... a) const</arglist>
    </member>
    <member kind="function">
      <type>signal_with_accumulator &amp;</type>
      <name>operator=</name>
      <anchorfile>classsigc_1_1signal__with__accumulator.html</anchorfile>
      <anchor>a7b39842de44816e964a1e929028cb70d</anchor>
      <arglist>(const signal_with_accumulator &amp;src)</arglist>
    </member>
    <member kind="function">
      <type>signal_with_accumulator &amp;</type>
      <name>operator=</name>
      <anchorfile>classsigc_1_1signal__with__accumulator.html</anchorfile>
      <anchor>a6bad4f67746c456448f565993c462f23</anchor>
      <arglist>(signal_with_accumulator &amp;&amp;src)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sigc::slot&lt; T_return(T_arg...)&gt;</name>
    <filename>classsigc_1_1slot_3_01T__return_07T__arg_8_8_8_08_4.html</filename>
    <templarg>typename T_return</templarg>
    <templarg>typename... T_arg</templarg>
    <base>sigc::slot_base</base>
    <member kind="function">
      <type></type>
      <name>slot</name>
      <anchorfile>classsigc_1_1slot_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>acc6f588781fd085c25f1971ef5011cce</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>slot</name>
      <anchorfile>classsigc_1_1slot_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>a414a664fc0112a68963e6e5187287237</anchor>
      <arglist>(const slot &amp;src)=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>slot</name>
      <anchorfile>classsigc_1_1slot_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>a4f8fd59d40e1c7551dfed6612ee631a9</anchor>
      <arglist>(const T_functor &amp;func)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>slot</name>
      <anchorfile>classsigc_1_1slot_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>ae7d852d9ac2c9a6a37564a0f4aed3872</anchor>
      <arglist>(slot &amp;&amp;src)</arglist>
    </member>
    <member kind="function">
      <type>T_return</type>
      <name>operator()</name>
      <anchorfile>classsigc_1_1slot_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>a6cdad9fd4a040e7cc99375b92d2d4f4b</anchor>
      <arglist>(type_trait_take_t&lt; T_arg &gt;... a) const</arglist>
    </member>
    <member kind="function">
      <type>slot &amp;</type>
      <name>operator=</name>
      <anchorfile>classsigc_1_1slot_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>a8a92ee77b3091c2ce1e5976ba2ff789d</anchor>
      <arglist>(const slot &amp;src)=default</arglist>
    </member>
    <member kind="function">
      <type>slot &amp;</type>
      <name>operator=</name>
      <anchorfile>classsigc_1_1slot_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>a1eeb6a2014989cdd06beafef83343596</anchor>
      <arglist>(slot &amp;&amp;src)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sigc::slot_base</name>
    <filename>classsigc_1_1slot__base.html</filename>
    <member kind="typedef">
      <type>notifiable::func_destroy_notify</type>
      <name>func_destroy_notify</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>a719ea8d3cec443f2e63717bfbae41a30</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>slot_base</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>a182d5db71ef371838c73bcf1c135cd9a</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>slot_base</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>aadcbb54832b5207bddf89ac5433b531a</anchor>
      <arglist>(const slot_base &amp;src)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>slot_base</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>a5fbc2bf38a0d9ebcbe13d578d2b3d5a1</anchor>
      <arglist>(rep_type *rep) noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>slot_base</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>ad1fee67a5885e424c275ad0f48fc81b1</anchor>
      <arglist>(slot_base &amp;&amp;src)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~slot_base</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>a75c18c50860f63fb020fc2953576ea57</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>add_destroy_notify_callback</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>a6864b09adae72d6c87d27adde7a1241b</anchor>
      <arglist>(notifiable *data, notifiable::func_destroy_notify func) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>block</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>a657a8473164c963a5ca4828c88121bb9</anchor>
      <arglist>(bool should_block=true) noexcept</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>blocked</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>a2f266b6147c4a6bbc5b68994d2dc1517</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>disconnect</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>a4042d221f7f07a7394d2eb0f14db2857</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>empty</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>ae6ac6ca962a1f6a7506d0817165b5cef</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>operator bool</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>a90d4d7d6037973a94d7dfd7ba9a5feb9</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>slot_base &amp;</type>
      <name>operator=</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>a922d3a3c2c781a63feb88ae46dac43fb</anchor>
      <arglist>(const slot_base &amp;src)</arglist>
    </member>
    <member kind="function">
      <type>slot_base &amp;</type>
      <name>operator=</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>af12025359fb1218699704e558ef3c3dd</anchor>
      <arglist>(slot_base &amp;&amp;src)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>remove_destroy_notify_callback</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>a98cadeae496214ddbcdb93defeef2290</anchor>
      <arglist>(notifiable *data) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_parent</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>a2b17848ee6104b628932c1fe5473ed1b</anchor>
      <arglist>(notifiable *parent, notifiable::func_destroy_notify cleanup) const noexcept</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>unblock</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>a25ad0bd4d2cea4dbfcd09f7d393d266d</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>blocked_</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>a9dc4958860c0f8300b461a743b7f2a2b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>rep_type *</type>
      <name>rep_</name>
      <anchorfile>classsigc_1_1slot__base.html</anchorfile>
      <anchor>aa482f7dfc73c6950abde0fd51b3125b5</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sigc::track_obj_functor</name>
    <filename>classsigc_1_1track__obj__functor.html</filename>
    <templarg>typename T_functor</templarg>
    <templarg>typename... T_obj</templarg>
    <base>sigc::adapts</base>
    <member kind="function">
      <type></type>
      <name>track_obj_functor</name>
      <anchorfile>classsigc_1_1track__obj__functor.html</anchorfile>
      <anchor>aae2c45966604c0841c5a26204e002981</anchor>
      <arglist>(const T_functor &amp;func, const T_obj &amp;... obj)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>operator()</name>
      <anchorfile>classsigc_1_1track__obj__functor.html</anchorfile>
      <anchor>af4e5d826d0b57d9556acbd7bc51269ee</anchor>
      <arglist>(T_arg &amp;&amp;... arg)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::trackable</name>
    <filename>structsigc_1_1trackable.html</filename>
    <base>sigc::notifiable</base>
    <member kind="typedef">
      <type>internal::func_destroy_notify</type>
      <name>func_destroy_notify</name>
      <anchorfile>structsigc_1_1trackable.html</anchorfile>
      <anchor>a1721dff57885c3ff2bc409538ceb8097</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>trackable</name>
      <anchorfile>structsigc_1_1trackable.html</anchorfile>
      <anchor>a7e1348841e762fb41b41c6f2ce9fa073</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>trackable</name>
      <anchorfile>structsigc_1_1trackable.html</anchorfile>
      <anchor>ac8431d9452c9698a012597e6560c72fa</anchor>
      <arglist>(const trackable &amp;src) noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>trackable</name>
      <anchorfile>structsigc_1_1trackable.html</anchorfile>
      <anchor>a9a6ff5a4d7c51cede2117525f470f96a</anchor>
      <arglist>(trackable &amp;&amp;src) noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~trackable</name>
      <anchorfile>structsigc_1_1trackable.html</anchorfile>
      <anchor>a75587da09e30031db7a2519843f1f4fb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>add_destroy_notify_callback</name>
      <anchorfile>structsigc_1_1trackable.html</anchorfile>
      <anchor>a7e9678b7a0e59db3a7220689484dad34</anchor>
      <arglist>(notifiable *data, func_destroy_notify func) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>notify_callbacks</name>
      <anchorfile>structsigc_1_1trackable.html</anchorfile>
      <anchor>af2e23cfe7adc1ca844a3350bbac557cb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>trackable &amp;</type>
      <name>operator=</name>
      <anchorfile>structsigc_1_1trackable.html</anchorfile>
      <anchor>a4e72c35edcd1ddc421c9ae3c667e9e00</anchor>
      <arglist>(const trackable &amp;src)</arglist>
    </member>
    <member kind="function">
      <type>trackable &amp;</type>
      <name>operator=</name>
      <anchorfile>structsigc_1_1trackable.html</anchorfile>
      <anchor>a4199ab99f5332e3ef84ee048743dcb0e</anchor>
      <arglist>(trackable &amp;&amp;src) noexcept</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>remove_destroy_notify_callback</name>
      <anchorfile>structsigc_1_1trackable.html</anchorfile>
      <anchor>a93be460f50044c6213b82f6ac4ba07fa</anchor>
      <arglist>(notifiable *data) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sigc::trackable_signal&lt; T_return(T_arg...)&gt;</name>
    <filename>classsigc_1_1trackable__signal_3_01T__return_07T__arg_8_8_8_08_4.html</filename>
    <templarg>typename T_return</templarg>
    <templarg>typename... T_arg</templarg>
    <base>trackable_signal_with_accumulator&lt; T_return, void, T_arg... &gt;</base>
    <class kind="class">sigc::trackable_signal&lt; T_return(T_arg...)&gt;::accumulated</class>
    <member kind="typedef">
      <type>void</type>
      <name>accumulator_type</name>
      <anchorfile>classsigc_1_1trackable__signal_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>a3f3b6f51c190c69f37e598296bcb80e9</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>trackable_signal</name>
      <anchorfile>classsigc_1_1trackable__signal_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>ad3c47f803cd1a71b9dec527f3f8db500</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>trackable_signal</name>
      <anchorfile>classsigc_1_1trackable__signal_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>a8d45c87c39c6e101cb34a103f5ac242c</anchor>
      <arglist>(const trackable_signal &amp;src)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>trackable_signal</name>
      <anchorfile>classsigc_1_1trackable__signal_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>a4cbf597b0d192c0f1f642fd6834c4bbd</anchor>
      <arglist>(trackable_signal &amp;&amp;src)</arglist>
    </member>
    <member kind="function">
      <type>trackable_signal &amp;</type>
      <name>operator=</name>
      <anchorfile>classsigc_1_1trackable__signal_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>a53ce1e04637c169866b7d6e91f78b912</anchor>
      <arglist>(const trackable_signal &amp;src)</arglist>
    </member>
    <member kind="function">
      <type>trackable_signal &amp;</type>
      <name>operator=</name>
      <anchorfile>classsigc_1_1trackable__signal_3_01T__return_07T__arg_8_8_8_08_4.html</anchorfile>
      <anchor>a0c84816b08bef5a456174f378c6ea8ac</anchor>
      <arglist>(trackable_signal &amp;&amp;src)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sigc::trackable_signal&lt; T_return(T_arg...)&gt;::accumulated</name>
    <filename>classsigc_1_1trackable__signal_3_01T__return_07T__arg_8_8_8_08_4_1_1accumulated.html</filename>
    <templarg>typename T_accumulator</templarg>
    <base>trackable_signal_with_accumulator&lt; T_return, T_accumulator, T_arg... &gt;</base>
    <member kind="function">
      <type></type>
      <name>accumulated</name>
      <anchorfile>classsigc_1_1trackable__signal_3_01T__return_07T__arg_8_8_8_08_4_1_1accumulated.html</anchorfile>
      <anchor>ab2c6213b8e61bf91250ab44e6928ebf2</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>accumulated</name>
      <anchorfile>classsigc_1_1trackable__signal_3_01T__return_07T__arg_8_8_8_08_4_1_1accumulated.html</anchorfile>
      <anchor>a46c808a8422150e04cedbbdd5603c954</anchor>
      <arglist>(const accumulated &amp;src)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>sigc::trackable_signal_with_accumulator</name>
    <filename>classsigc_1_1trackable__signal__with__accumulator.html</filename>
    <templarg>typename T_return</templarg>
    <templarg>typename T_accumulator</templarg>
    <templarg>typename... T_arg</templarg>
    <base>sigc::signal_base</base>
    <base>sigc::trackable</base>
    <member kind="typedef">
      <type>slot&lt; T_return(T_arg...)&gt;</type>
      <name>slot_type</name>
      <anchorfile>classsigc_1_1trackable__signal__with__accumulator.html</anchorfile>
      <anchor>aaf6cdea4aa12b5aef238d3047c0b2422</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>trackable_signal_with_accumulator</name>
      <anchorfile>classsigc_1_1trackable__signal__with__accumulator.html</anchorfile>
      <anchor>ab7f0c41e4a62cd816e49062c13d5db94</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>trackable_signal_with_accumulator</name>
      <anchorfile>classsigc_1_1trackable__signal__with__accumulator.html</anchorfile>
      <anchor>ad430738ff4caaa7386a97537e05eeac9</anchor>
      <arglist>(const trackable_signal_with_accumulator &amp;src)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>trackable_signal_with_accumulator</name>
      <anchorfile>classsigc_1_1trackable__signal__with__accumulator.html</anchorfile>
      <anchor>a8986fdbf7fbf935d507ad6571d8fe5f2</anchor>
      <arglist>(trackable_signal_with_accumulator &amp;&amp;src)</arglist>
    </member>
    <member kind="function">
      <type>connection</type>
      <name>connect</name>
      <anchorfile>classsigc_1_1trackable__signal__with__accumulator.html</anchorfile>
      <anchor>a0f10465f8ff1b2af410937ca80971522</anchor>
      <arglist>(const slot_type &amp;slot_)</arglist>
    </member>
    <member kind="function">
      <type>connection</type>
      <name>connect</name>
      <anchorfile>classsigc_1_1trackable__signal__with__accumulator.html</anchorfile>
      <anchor>afa86d640a768c1d63e9c27ae0fa012cb</anchor>
      <arglist>(slot_type &amp;&amp;slot_)</arglist>
    </member>
    <member kind="function">
      <type>connection</type>
      <name>connect_first</name>
      <anchorfile>classsigc_1_1trackable__signal__with__accumulator.html</anchorfile>
      <anchor>a6225f2e8a1d727f51f40713175fa5e91</anchor>
      <arglist>(const slot_type &amp;slot_)</arglist>
    </member>
    <member kind="function">
      <type>connection</type>
      <name>connect_first</name>
      <anchorfile>classsigc_1_1trackable__signal__with__accumulator.html</anchorfile>
      <anchor>a46f7818bcb7a9dda59cb2c8b87cd3e22</anchor>
      <arglist>(slot_type &amp;&amp;slot_)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>emit</name>
      <anchorfile>classsigc_1_1trackable__signal__with__accumulator.html</anchorfile>
      <anchor>a547fff9c2844aa9826fb3441da6be7b3</anchor>
      <arglist>(type_trait_take_t&lt; T_arg &gt;... a) const</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>make_slot</name>
      <anchorfile>classsigc_1_1trackable__signal__with__accumulator.html</anchorfile>
      <anchor>a6d73da1f9cee99324254db081d93b953</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>operator()</name>
      <anchorfile>classsigc_1_1trackable__signal__with__accumulator.html</anchorfile>
      <anchor>aec5df341ee81f72af8effec8b132e79d</anchor>
      <arglist>(type_trait_take_t&lt; T_arg &gt;... a) const</arglist>
    </member>
    <member kind="function">
      <type>trackable_signal_with_accumulator &amp;</type>
      <name>operator=</name>
      <anchorfile>classsigc_1_1trackable__signal__with__accumulator.html</anchorfile>
      <anchor>a67a6eed264aef36be588185515c8e5de</anchor>
      <arglist>(const trackable_signal_with_accumulator &amp;src)</arglist>
    </member>
    <member kind="function">
      <type>trackable_signal_with_accumulator &amp;</type>
      <name>operator=</name>
      <anchorfile>classsigc_1_1trackable__signal__with__accumulator.html</anchorfile>
      <anchor>a904ee3bc5d69ffbc6aca67cf3bdb2ba9</anchor>
      <arglist>(trackable_signal_with_accumulator &amp;&amp;src)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::type_trait</name>
    <filename>structsigc_1_1type__trait.html</filename>
    <templarg>typename T_type</templarg>
    <member kind="typedef">
      <type>T_type &amp;</type>
      <name>pass</name>
      <anchorfile>structsigc_1_1type__trait.html</anchorfile>
      <anchor>a7bc07ab05291c9e76192c662ac53f5b0</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>const T_type &amp;</type>
      <name>take</name>
      <anchorfile>structsigc_1_1type__trait.html</anchorfile>
      <anchor>a628e6e7930d6551bd4f884b02bcd5d17</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::type_trait&lt; const T_type &amp; &gt;</name>
    <filename>structsigc_1_1type__trait_3_01const_01T__type_01_6_01_4.html</filename>
    <templarg>typename T_type</templarg>
    <member kind="typedef">
      <type>const T_type &amp;</type>
      <name>pass</name>
      <anchorfile>structsigc_1_1type__trait_3_01const_01T__type_01_6_01_4.html</anchorfile>
      <anchor>a2354c3ddf9a055f693941d8353385ffa</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>const T_type &amp;</type>
      <name>take</name>
      <anchorfile>structsigc_1_1type__trait_3_01const_01T__type_01_6_01_4.html</anchorfile>
      <anchor>acc1d043f494e55adc45e1439a402c298</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::type_trait&lt; T_type &amp; &gt;</name>
    <filename>structsigc_1_1type__trait_3_01T__type_01_6_01_4.html</filename>
    <templarg>typename T_type</templarg>
    <member kind="typedef">
      <type>T_type &amp;</type>
      <name>pass</name>
      <anchorfile>structsigc_1_1type__trait_3_01T__type_01_6_01_4.html</anchorfile>
      <anchor>a142c6b05d842c93a0da4dbd04d529409</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>T_type &amp;</type>
      <name>take</name>
      <anchorfile>structsigc_1_1type__trait_3_01T__type_01_6_01_4.html</anchorfile>
      <anchor>a966fa5c1414593811fee9a7e4cb0987f</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::type_trait&lt; T_type &amp;&amp; &gt;</name>
    <filename>structsigc_1_1type__trait_3_01T__type_01_6_6_01_4.html</filename>
    <templarg>typename T_type</templarg>
    <member kind="typedef">
      <type>T_type &amp;&amp;</type>
      <name>pass</name>
      <anchorfile>structsigc_1_1type__trait_3_01T__type_01_6_6_01_4.html</anchorfile>
      <anchor>a337e6dbd33a45d03ca371e50678978cc</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>T_type &amp;&amp;</type>
      <name>take</name>
      <anchorfile>structsigc_1_1type__trait_3_01T__type_01_6_6_01_4.html</anchorfile>
      <anchor>a7bcd2f9ae21fb0efd395f96f8ca7c906</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::type_trait&lt; T_type[N]&gt;</name>
    <filename>structsigc_1_1type__trait_3_01T__type_0fN_0e_4.html</filename>
    <templarg>typename T_type</templarg>
    <templarg>int N</templarg>
    <member kind="typedef">
      <type>T_type *&amp;</type>
      <name>pass</name>
      <anchorfile>structsigc_1_1type__trait_3_01T__type_0fN_0e_4.html</anchorfile>
      <anchor>acca526a7a67432da8a147a523f8ee11e</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>const T_type *&amp;</type>
      <name>take</name>
      <anchorfile>structsigc_1_1type__trait_3_01T__type_0fN_0e_4.html</anchorfile>
      <anchor>a198b15156cd2136917e23b3fa1ae278e</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::type_trait&lt; void &gt;</name>
    <filename>structsigc_1_1type__trait_3_01void_01_4.html</filename>
    <member kind="typedef">
      <type>void</type>
      <name>pass</name>
      <anchorfile>structsigc_1_1type__trait_3_01void_01_4.html</anchorfile>
      <anchor>aab612d64e1797770630fa9f486b8d972</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>void</type>
      <name>take</name>
      <anchorfile>structsigc_1_1type__trait_3_01void_01_4.html</anchorfile>
      <anchor>a8181667b02cb286afd339613b0e5d3c2</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::unwrap_reference</name>
    <filename>structsigc_1_1unwrap__reference.html</filename>
    <templarg>typename T_type</templarg>
    <member kind="typedef">
      <type>T_type</type>
      <name>type</name>
      <anchorfile>structsigc_1_1unwrap__reference.html</anchorfile>
      <anchor>a4fce6ccdec89d46831dc3b0d2e62e583</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::unwrap_reference&lt; std::reference_wrapper&lt; const T_type &gt; &gt;</name>
    <filename>structsigc_1_1unwrap__reference_3_01std_1_1reference__wrapper_3_01const_01T__type_01_4_01_4.html</filename>
    <templarg>typename T_type</templarg>
    <member kind="typedef">
      <type>const T_type &amp;</type>
      <name>type</name>
      <anchorfile>structsigc_1_1unwrap__reference_3_01std_1_1reference__wrapper_3_01const_01T__type_01_4_01_4.html</anchorfile>
      <anchor>a7715612ec7a2d390bce25b1ea313adc7</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::unwrap_reference&lt; std::reference_wrapper&lt; T_type &gt; &gt;</name>
    <filename>structsigc_1_1unwrap__reference_3_01std_1_1reference__wrapper_3_01T__type_01_4_01_4.html</filename>
    <templarg>typename T_type</templarg>
    <member kind="typedef">
      <type>T_type &amp;</type>
      <name>type</name>
      <anchorfile>structsigc_1_1unwrap__reference_3_01std_1_1reference__wrapper_3_01T__type_01_4_01_4.html</anchorfile>
      <anchor>a5bc4ccb4302aaeabd066e29259ceff6b</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>sigc::visitor</name>
    <filename>structsigc_1_1visitor.html</filename>
    <templarg>typename T_functor</templarg>
    <member kind="function" static="yes">
      <type>static void</type>
      <name>do_visit_each</name>
      <anchorfile>structsigc_1_1visitor.html</anchorfile>
      <anchor>a75d738d8762f376582cfd257ca912fff</anchor>
      <arglist>(const T_action &amp;action, const T_functor &amp;functor)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>sigc</name>
    <filename>namespacesigc.html</filename>
    <class kind="struct">sigc::adaptor_base</class>
    <class kind="struct">sigc::adaptor_functor</class>
    <class kind="struct">sigc::adaptor_trait</class>
    <class kind="struct">sigc::adaptor_trait&lt; T_functor, false &gt;</class>
    <class kind="struct">sigc::adaptor_trait&lt; T_functor, true &gt;</class>
    <class kind="struct">sigc::adapts</class>
    <class kind="struct">sigc::bind_functor</class>
    <class kind="struct">sigc::bind_functor&lt;-1, T_functor, T_type... &gt;</class>
    <class kind="struct">sigc::bind_return_functor</class>
    <class kind="class">sigc::bound_argument</class>
    <class kind="class">sigc::bound_argument&lt; std::reference_wrapper&lt; const T_wrapped &gt; &gt;</class>
    <class kind="class">sigc::bound_argument&lt; std::reference_wrapper&lt; T_wrapped &gt; &gt;</class>
    <class kind="class">sigc::bound_mem_functor</class>
    <class kind="struct">sigc::compose1_functor</class>
    <class kind="struct">sigc::compose2_functor</class>
    <class kind="struct">sigc::connection</class>
    <class kind="struct">sigc::exception_catch_functor</class>
    <class kind="struct">sigc::functor_trait</class>
    <class kind="struct">sigc::hide_functor</class>
    <class kind="class">sigc::limit_reference</class>
    <class kind="class">sigc::limit_reference&lt; T_type, true &gt;</class>
    <class kind="class">sigc::mem_functor</class>
    <class kind="struct">sigc::notifiable</class>
    <class kind="class">sigc::pointer_functor</class>
    <class kind="class">sigc::pointer_functor&lt; T_return(T_args...)&gt;</class>
    <class kind="struct">sigc::retype_functor</class>
    <class kind="struct">sigc::retype_return_functor</class>
    <class kind="struct">sigc::retype_return_functor&lt; void, T_functor &gt;</class>
    <class kind="struct">sigc::scoped_connection</class>
    <class kind="class">sigc::signal&lt; T_return(T_arg...)&gt;</class>
    <class kind="struct">sigc::signal_base</class>
    <class kind="class">sigc::signal_with_accumulator</class>
    <class kind="class">sigc::slot&lt; T_return(T_arg...)&gt;</class>
    <class kind="class">sigc::slot_base</class>
    <class kind="class">sigc::track_obj_functor</class>
    <class kind="struct">sigc::trackable</class>
    <class kind="class">sigc::trackable_signal&lt; T_return(T_arg...)&gt;</class>
    <class kind="class">sigc::trackable_signal_with_accumulator</class>
    <class kind="struct">sigc::type_trait</class>
    <class kind="struct">sigc::type_trait&lt; const T_type &amp; &gt;</class>
    <class kind="struct">sigc::type_trait&lt; T_type &amp; &gt;</class>
    <class kind="struct">sigc::type_trait&lt; T_type &amp;&amp; &gt;</class>
    <class kind="struct">sigc::type_trait&lt; T_type[N]&gt;</class>
    <class kind="struct">sigc::type_trait&lt; void &gt;</class>
    <class kind="struct">sigc::unwrap_reference</class>
    <class kind="struct">sigc::unwrap_reference&lt; std::reference_wrapper&lt; const T_type &gt; &gt;</class>
    <class kind="struct">sigc::unwrap_reference&lt; std::reference_wrapper&lt; T_type &gt; &gt;</class>
    <class kind="struct">sigc::visitor</class>
    <member kind="typedef">
      <type>typename type_trait&lt; T &gt;::pass</type>
      <name>type_trait_pass_t</name>
      <anchorfile>namespacesigc.html</anchorfile>
      <anchor>aa2d13c7fc829cfec6e0f9d5092f2aa79</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename type_trait&lt; T &gt;::take</type>
      <name>type_trait_take_t</name>
      <anchorfile>namespacesigc.html</anchorfile>
      <anchor>aa0d56c61023af35c47b79db80b32fd2e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>bind</name>
      <anchorfile>group__bind.html</anchorfile>
      <anchor>ga5f3052c2e56f44047bc5627fc3d5ed63</anchor>
      <arglist>(const T_functor &amp;func, T_bound... b)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>bind</name>
      <anchorfile>group__bind.html</anchorfile>
      <anchor>ga572970c90b3b5de4729ae607cd134a48</anchor>
      <arglist>(const T_functor &amp;func, T_type... b)</arglist>
    </member>
    <member kind="function">
      <type>bind_return_functor&lt; T_return, T_functor &gt;</type>
      <name>bind_return</name>
      <anchorfile>group__bind.html</anchorfile>
      <anchor>gaece2aa90f5870abc5381cc56a97033f4</anchor>
      <arglist>(const T_functor &amp;functor, T_return ret_value)</arglist>
    </member>
    <member kind="function">
      <type>compose1_functor&lt; T_setter, T_getter &gt;</type>
      <name>compose</name>
      <anchorfile>group__compose.html</anchorfile>
      <anchor>gaa531085a74aef0b79d2323f0e883e49c</anchor>
      <arglist>(const T_setter &amp;setter, const T_getter &amp;getter)</arglist>
    </member>
    <member kind="function">
      <type>compose2_functor&lt; T_setter, T_getter1, T_getter2 &gt;</type>
      <name>compose</name>
      <anchorfile>group__compose.html</anchorfile>
      <anchor>ga4644801ade5fdae4da9e71e9c82453d6</anchor>
      <arglist>(const T_setter &amp;setter, const T_getter1 &amp;getter1, const T_getter2 &amp;getter2)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>exception_catch</name>
      <anchorfile>namespacesigc.html</anchorfile>
      <anchor>a087997a75b3111a3f3794d7215fd8cc1</anchor>
      <arglist>(const T_functor &amp;func, const T_catcher &amp;catcher)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>hide</name>
      <anchorfile>group__hide.html</anchorfile>
      <anchor>ga9fb2e235e725beff4941a0ec076b4def</anchor>
      <arglist>(const T_functor &amp;func)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>hide</name>
      <anchorfile>group__hide.html</anchorfile>
      <anchor>ga83b17f6ce498f801415d1fb662344b9b</anchor>
      <arglist>(const T_functor &amp;func)</arglist>
    </member>
    <member kind="function">
      <type>retype_return_functor&lt; void, T_functor &gt;</type>
      <name>hide_return</name>
      <anchorfile>group__hide.html</anchorfile>
      <anchor>gace1905da607075b4449613fb3ce8afed</anchor>
      <arglist>(const T_functor &amp;functor)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>mem_fun</name>
      <anchorfile>group__mem__fun.html</anchorfile>
      <anchor>ga3b501a5f603a575b05a8985af4485adf</anchor>
      <arglist>(T_obj &amp;obj, T_return(T_obj2::*func)(T_arg...))</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>mem_fun</name>
      <anchorfile>group__mem__fun.html</anchorfile>
      <anchor>ga5d28dcf1bb88830a6e50d08d1fe7ec08</anchor>
      <arglist>(T_return(T_obj::*func)(T_arg...))</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>ptr_fun</name>
      <anchorfile>group__ptr__fun.html</anchorfile>
      <anchor>ga90d9748e4be611e80869c0a6a8d8e62a</anchor>
      <arglist>(T_return(*func)(T_args...))</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>retype</name>
      <anchorfile>group__retype.html</anchorfile>
      <anchor>gadfd6bb36213c29b50a14fe4b9f19306c</anchor>
      <arglist>(const T_functor&lt; T_func, T_arg... &gt; &amp;functor)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>retype</name>
      <anchorfile>group__retype.html</anchorfile>
      <anchor>gac4067e1b90fac1396a4850a0fe8f3b45</anchor>
      <arglist>(const T_functor&lt; T_return(T_arg...)&gt; &amp;functor)</arglist>
    </member>
    <member kind="function">
      <type>retype_return_functor&lt; T_return, T_functor &gt;</type>
      <name>retype_return</name>
      <anchorfile>group__retype.html</anchorfile>
      <anchor>ga4f0b95bc036c987ec5940a383b0695e5</anchor>
      <arglist>(const T_functor &amp;functor)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>swap</name>
      <anchorfile>namespacesigc.html</anchorfile>
      <anchor>aeb9b228b9f0f3befb4784bdda22cd179</anchor>
      <arglist>(scoped_connection &amp;sca, scoped_connection &amp;scb) noexcept</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>track_obj</name>
      <anchorfile>group__track__obj.html</anchorfile>
      <anchor>gaf6c81ae078b3cb2a9809ecbd09b1c123</anchor>
      <arglist>(const T_functor &amp;func, const T_obj &amp;... obj)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>track_object</name>
      <anchorfile>group__track__obj.html</anchorfile>
      <anchor>gad4baa7c8ace9d51344f85d121d08b2cc</anchor>
      <arglist>(const T_functor &amp;func, const T_obj1 &amp;obj1, const T_objs &amp;... objs)</arglist>
    </member>
    <member kind="function">
      <type>const T_type &amp;</type>
      <name>unwrap</name>
      <anchorfile>namespacesigc.html</anchorfile>
      <anchor>a5f866aae1624bf96aa2dc9e9d320a591</anchor>
      <arglist>(const std::reference_wrapper&lt; const T_type &gt; &amp;v)</arglist>
    </member>
    <member kind="function">
      <type>T_type &amp;</type>
      <name>unwrap</name>
      <anchorfile>namespacesigc.html</anchorfile>
      <anchor>a640a579a99e9159dfe9b85a717210f68</anchor>
      <arglist>(const std::reference_wrapper&lt; T_type &gt; &amp;v)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>visit_each</name>
      <anchorfile>group__sigcfunctors.html</anchorfile>
      <anchor>ga5e7aa8b975e706f4fe9e8365892a7fd0</anchor>
      <arglist>(const T_action &amp;action, const T_functor &amp;functor)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>visit_each_trackable</name>
      <anchorfile>group__sigcfunctors.html</anchorfile>
      <anchor>gaa352d90af3801576a8e0c7d176e5571d</anchor>
      <arglist>(const T_action &amp;action, const T_functor &amp;functor)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>adaptors</name>
    <title>Adaptors</title>
    <filename>group__adaptors.html</filename>
    <subgroup>bind</subgroup>
    <subgroup>compose</subgroup>
    <subgroup>exception_catch</subgroup>
    <subgroup>hide</subgroup>
    <subgroup>retype</subgroup>
    <subgroup>track_obj</subgroup>
    <class kind="struct">sigc::adaptor_base</class>
    <class kind="struct">sigc::adaptor_functor</class>
    <class kind="struct">sigc::adaptor_trait</class>
    <class kind="struct">sigc::adapts</class>
  </compound>
  <compound kind="group">
    <name>sigcfunctors</name>
    <title>Functors</title>
    <filename>group__sigcfunctors.html</filename>
    <subgroup>slot</subgroup>
    <subgroup>mem_fun</subgroup>
    <subgroup>ptr_fun</subgroup>
    <class kind="struct">sigc::functor_trait</class>
    <class kind="struct">sigc::visitor</class>
    <member kind="function">
      <type>void</type>
      <name>visit_each</name>
      <anchorfile>group__sigcfunctors.html</anchorfile>
      <anchor>ga5e7aa8b975e706f4fe9e8365892a7fd0</anchor>
      <arglist>(const T_action &amp;action, const T_functor &amp;functor)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>visit_each_trackable</name>
      <anchorfile>group__sigcfunctors.html</anchorfile>
      <anchor>gaa352d90af3801576a8e0c7d176e5571d</anchor>
      <arglist>(const T_action &amp;action, const T_functor &amp;functor)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>signal</name>
    <title>Signals</title>
    <filename>group__signal.html</filename>
    <class kind="struct">sigc::connection</class>
    <class kind="struct">sigc::scoped_connection</class>
    <class kind="class">sigc::signal&lt; T_return(T_arg...)&gt;</class>
    <class kind="class">sigc::signal&lt; T_return(T_arg...)&gt;::accumulated</class>
    <class kind="struct">sigc::signal_base</class>
    <class kind="class">sigc::signal_with_accumulator</class>
    <class kind="struct">sigc::trackable</class>
    <class kind="class">sigc::trackable_signal&lt; T_return(T_arg...)&gt;</class>
    <class kind="class">sigc::trackable_signal&lt; T_return(T_arg...)&gt;::accumulated</class>
    <class kind="class">sigc::trackable_signal_with_accumulator</class>
  </compound>
  <compound kind="group">
    <name>slot</name>
    <title>Slots</title>
    <filename>group__slot.html</filename>
    <class kind="class">sigc::slot&lt; T_return(T_arg...)&gt;</class>
    <class kind="class">sigc::slot_base</class>
    <docanchor file="group__slot.html" title="Creating Slots">slots-creating</docanchor>
    <docanchor file="group__slot.html" title="Member Methods and Automatic Disconnection">slots-auto-disconnect</docanchor>
    <docanchor file="group__slot.html" title="auto">slots-auto</docanchor>
    <docanchor file="group__slot.html" title="C++ Lambdas">slots-with-lambdas</docanchor>
  </compound>
  <compound kind="group">
    <name>bind</name>
    <title>bind(), bind_return()</title>
    <filename>group__bind.html</filename>
    <class kind="struct">sigc::bind_functor</class>
    <class kind="struct">sigc::bind_functor&lt;-1, T_functor, T_type... &gt;</class>
    <class kind="struct">sigc::bind_return_functor</class>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>bind</name>
      <anchorfile>group__bind.html</anchorfile>
      <anchor>ga5f3052c2e56f44047bc5627fc3d5ed63</anchor>
      <arglist>(const T_functor &amp;func, T_bound... b)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>bind</name>
      <anchorfile>group__bind.html</anchorfile>
      <anchor>ga572970c90b3b5de4729ae607cd134a48</anchor>
      <arglist>(const T_functor &amp;func, T_type... b)</arglist>
    </member>
    <member kind="function">
      <type>bind_return_functor&lt; T_return, T_functor &gt;</type>
      <name>bind_return</name>
      <anchorfile>group__bind.html</anchorfile>
      <anchor>gaece2aa90f5870abc5381cc56a97033f4</anchor>
      <arglist>(const T_functor &amp;functor, T_return ret_value)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>compose</name>
    <title>compose()</title>
    <filename>group__compose.html</filename>
    <class kind="struct">sigc::compose1_functor</class>
    <class kind="struct">sigc::compose2_functor</class>
    <member kind="function">
      <type>compose1_functor&lt; T_setter, T_getter &gt;</type>
      <name>compose</name>
      <anchorfile>group__compose.html</anchorfile>
      <anchor>gaa531085a74aef0b79d2323f0e883e49c</anchor>
      <arglist>(const T_setter &amp;setter, const T_getter &amp;getter)</arglist>
    </member>
    <member kind="function">
      <type>compose2_functor&lt; T_setter, T_getter1, T_getter2 &gt;</type>
      <name>compose</name>
      <anchorfile>group__compose.html</anchorfile>
      <anchor>ga4644801ade5fdae4da9e71e9c82453d6</anchor>
      <arglist>(const T_setter &amp;setter, const T_getter1 &amp;getter1, const T_getter2 &amp;getter2)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>exception_catch</name>
    <title>exception_catch()</title>
    <filename>group__exception__catch.html</filename>
  </compound>
  <compound kind="group">
    <name>hide</name>
    <title>hide(), hide_return()</title>
    <filename>group__hide.html</filename>
    <class kind="struct">sigc::hide_functor</class>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>hide</name>
      <anchorfile>group__hide.html</anchorfile>
      <anchor>ga9fb2e235e725beff4941a0ec076b4def</anchor>
      <arglist>(const T_functor &amp;func)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>hide</name>
      <anchorfile>group__hide.html</anchorfile>
      <anchor>ga83b17f6ce498f801415d1fb662344b9b</anchor>
      <arglist>(const T_functor &amp;func)</arglist>
    </member>
    <member kind="function">
      <type>retype_return_functor&lt; void, T_functor &gt;</type>
      <name>hide_return</name>
      <anchorfile>group__hide.html</anchorfile>
      <anchor>gace1905da607075b4449613fb3ce8afed</anchor>
      <arglist>(const T_functor &amp;functor)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>mem_fun</name>
    <title>mem_fun()</title>
    <filename>group__mem__fun.html</filename>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>mem_fun</name>
      <anchorfile>group__mem__fun.html</anchorfile>
      <anchor>ga3b501a5f603a575b05a8985af4485adf</anchor>
      <arglist>(T_obj &amp;obj, T_return(T_obj2::*func)(T_arg...))</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>mem_fun</name>
      <anchorfile>group__mem__fun.html</anchorfile>
      <anchor>ga5d28dcf1bb88830a6e50d08d1fe7ec08</anchor>
      <arglist>(T_return(T_obj::*func)(T_arg...))</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>ptr_fun</name>
    <title>ptr_fun()</title>
    <filename>group__ptr__fun.html</filename>
    <class kind="class">sigc::pointer_functor</class>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>ptr_fun</name>
      <anchorfile>group__ptr__fun.html</anchorfile>
      <anchor>ga90d9748e4be611e80869c0a6a8d8e62a</anchor>
      <arglist>(T_return(*func)(T_args...))</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>retype</name>
    <title>retype(), retype_return()</title>
    <filename>group__retype.html</filename>
    <class kind="struct">sigc::retype_functor</class>
    <class kind="struct">sigc::retype_return_functor</class>
    <class kind="struct">sigc::retype_return_functor&lt; void, T_functor &gt;</class>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>retype</name>
      <anchorfile>group__retype.html</anchorfile>
      <anchor>gadfd6bb36213c29b50a14fe4b9f19306c</anchor>
      <arglist>(const T_functor&lt; T_func, T_arg... &gt; &amp;functor)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>retype</name>
      <anchorfile>group__retype.html</anchorfile>
      <anchor>gac4067e1b90fac1396a4850a0fe8f3b45</anchor>
      <arglist>(const T_functor&lt; T_return(T_arg...)&gt; &amp;functor)</arglist>
    </member>
    <member kind="function">
      <type>retype_return_functor&lt; T_return, T_functor &gt;</type>
      <name>retype_return</name>
      <anchorfile>group__retype.html</anchorfile>
      <anchor>ga4f0b95bc036c987ec5940a383b0695e5</anchor>
      <arglist>(const T_functor &amp;functor)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>track_obj</name>
    <title>track_obj(), track_object()</title>
    <filename>group__track__obj.html</filename>
    <class kind="class">sigc::track_obj_functor</class>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>track_obj</name>
      <anchorfile>group__track__obj.html</anchorfile>
      <anchor>gaf6c81ae078b3cb2a9809ecbd09b1c123</anchor>
      <arglist>(const T_functor &amp;func, const T_obj &amp;... obj)</arglist>
    </member>
    <member kind="function">
      <type>decltype(auto)</type>
      <name>track_object</name>
      <anchorfile>group__track__obj.html</anchorfile>
      <anchor>gad4baa7c8ace9d51344f85d121d08b2cc</anchor>
      <arglist>(const T_functor &amp;func, const T_obj1 &amp;obj1, const T_objs &amp;... objs)</arglist>
    </member>
  </compound>
  <compound kind="page">
    <name>index</name>
    <title>libsigc++ Reference Manual</title>
    <filename>index.html</filename>
    <docanchor file="index.html" title="Description">description</docanchor>
    <docanchor file="index.html" title="Features">features</docanchor>
    <docanchor file="index.html" title="Basic Usage">basics</docanchor>
    <docanchor file="index.html" title="Using Meson">meson</docanchor>
    <docanchor file="index.html" title="Using Autotools">autotools</docanchor>
    <docanchor file="index.html" title="Using CMake">cmake</docanchor>
  </compound>
</tagfile>
