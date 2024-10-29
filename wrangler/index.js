export default {
  async fetch(request, env, ctx) {
    const response = await fetch("http://fileserver:9000/10mb.html");
    return response;
  }
};
