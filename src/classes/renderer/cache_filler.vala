namespace org.westhoffswelt.pdfpresenter {
   public class Renderer.CacheFiller
    {
        protected Renderer.Cache.Base cache = null; 
        
        protected Metadata.Pdf metadata = null;

        protected Renderer.Pdf renderer = null;

        int slides_prerenderred = 0;

        public CacheFiller( Metadata.Pdf metadata ) {
            this.metadata = metadata;
            this.renderer = new Renderer.Pdf(metadata,
                                             (int)metadata.get_page_width(), (int)metadata.get_page_height());
            this.cache = Cache.OptionFactory.create(this.metadata);
        }

        public bool prerender_slides() {
            try {
                var pixmap = this.renderer.render_to_pixmap(slides_prerenderred);
                this.cache.store(slides_prerenderred, pixmap);
            }
            catch( Renderer.RenderError e) {
                error( "Could not render page '%i' while pre-rendering: %s",
                       slides_prerenderred, e.message );
            }
            stdout.printf("Prerenderer: %d\n", slides_prerenderred);
            ++slides_prerenderred;
            return (slides_prerenderred < this.metadata.get_slide_count());
        }
    }
}
