namespace org.westhoffswelt.pdfpresenter {
   public class Renderer.CacheFiller
    {
        protected Renderer.Cache.Base cache = null; 
        
        protected Metadata.Pdf metadata = null;

        protected Renderer.Pdf renderer = null;

        int slides_prerenderred = 0;

        public CacheFiller( Metadata.Pdf metadata ) {
            this.metadata = metadata;
            renderer = new Renderer.Pdf(metadata,
                                        metadata.get_page_width(), metadata.get_page_height());
        }

        public bool prerender_slides() {
            stdout.printf("Prerenderer: %d\n", slides_prerenderred);
            ++slides_prerenderred;
            return (slides_prerenderred < this.metadata.get_slide_count());
        }
    }
}
