{% extends '_layout.swig' %}
{% import '_macro/post-collapse.swig' as post_template %}
{% import '_macro/post.swig' as sticky_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %} {{ __('title.category') }}: {{ page.category }} | {{ config.title }} {% endblock %}

{% block content %}



<section id="posts" class="posts-expand">
{% for post in page.posts %}
    {% for tag in post.tags %}
        {% if tag.name=='CategoryOverview' %}
            {{ sticky_template.render(post, true) }}
        {% endif %}
    {% endfor %}
{% endfor %}

</section>
  <section id="posts" class="posts-collapse">
    <div class="collection-title">
      <h2 >
        {{ page.category }}
        <small>{{  __('title.category')  }}</small>
      </h2>
    </div>

    {% for post in page.posts %}
      {{ post_template.render(post) }}
    {% endfor %}
  </section>

  {% include '_partials/pagination.swig' %}

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
